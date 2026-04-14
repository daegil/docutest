#!/usr/bin/env bash
set -euo pipefail

REPO="daegil/docutest"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

FILES=("DOCS.md" "llm-wiki.md" "INIT_PROMPT.md")

# .claude/ 하네스 뼈대: 디렉토리 생성 + 존재 시 복사할 파일 목록
CLAUDE_DIRS=(
  ".claude"
  ".claude/commands"
  ".claude/agents"
  ".claude/skills"
  ".claude/hooks"
)

CLAUDE_FILES=(
  ".claude/settings.json"
  ".claude/README.md"
  ".claude/commands/ingest.md"
  ".claude/commands/wiki-query.md"
  ".claude/commands/wiki-lint.md"
  ".claude/commands/docs-new.md"
  ".claude/commands/docs-approve.md"
)

# Colors & styles
if [[ -t 1 ]]; then
  BOLD='\033[1m'
  DIM='\033[2m'
  ITALIC='\033[3m'
  GREEN='\033[38;5;78m'
  RED='\033[38;5;203m'
  YELLOW='\033[38;5;220m'
  CYAN='\033[38;5;81m'
  MAGENTA='\033[38;5;183m'
  GRAY='\033[38;5;245m'
  RESET='\033[0m'
else
  BOLD='' DIM='' ITALIC='' GREEN='' RED='' YELLOW=''
  CYAN='' MAGENTA='' GRAY='' RESET=''
fi

echo ""
echo -e "  ${MAGENTA}${BOLD}docutest${RESET}"
echo -e "  ${GRAY}Docusaurus docs + LLM Wiki kickstart for AI coding agents${RESET}"
echo ""
echo -e "  ${DIM}Scaffold a Docusaurus doc site with LLM-maintained wiki.${RESET}"
echo -e "  ${DIM}Project docs, knowledge wiki, and workflows - all ready to go.${RESET}"
echo ""

# Warn if current directory is not empty
if [ "$(ls -A 2>/dev/null)" ]; then
  echo -e "  ${YELLOW}▲${RESET}  ${YELLOW}Current directory is not empty.${RESET}"
  echo -e "     ${DIM}Running in an empty directory is recommended.${RESET}"
  echo ""
fi

# Download files
echo -e "  ${CYAN}●${RESET}  ${BOLD}Downloading files${RESET}"
echo ""

FAILED=0
for file in "${FILES[@]}"; do
  echo -ne "  ${DIM}◇${RESET}  ${DIM}${file}${RESET}"
  if curl -fsSL "${BASE_URL}/${file}" -o "${file}" 2>/dev/null; then
    echo -e "\r  ${GREEN}◆${RESET}  ${file}"
  else
    echo -e "\r  ${RED}◆${RESET}  ${file} ${RED}- download failed${RESET}"
    FAILED=1
  fi
done

echo ""

# .claude/ 뼈대 생성
echo -e "  ${CYAN}●${RESET}  ${BOLD}Scaffolding .claude/${RESET}"
echo ""

for dir in "${CLAUDE_DIRS[@]}"; do
  if mkdir -p "${dir}" 2>/dev/null; then
    echo -e "  ${GREEN}◆${RESET}  ${dir}/"
  else
    echo -e "  ${RED}◆${RESET}  ${dir}/ ${RED}- mkdir failed${RESET}"
    FAILED=1
  fi
done

for file in "${CLAUDE_FILES[@]}"; do
  echo -ne "  ${DIM}◇${RESET}  ${DIM}${file}${RESET}"
  mkdir -p "$(dirname "${file}")" 2>/dev/null || true
  if curl -fsSL "${BASE_URL}/${file}" -o "${file}" 2>/dev/null; then
    echo -e "\r  ${GREEN}◆${RESET}  ${file}"
  else
    # 레포에 없으면 조용히 skip (뼈대만 있는 경우)
    rm -f "${file}" 2>/dev/null || true
    echo -e "\r  ${GRAY}◇${RESET}  ${GRAY}${file} - skipped (not in repo)${RESET}"
  fi
done

echo ""

if [ "$FAILED" -eq 1 ]; then
  echo -e "  ${RED}✘  Some files failed to download.${RESET}"
  echo -e "     ${DIM}Check your network connection and try again.${RESET}"
  echo ""
  exit 1
fi

echo -e "  ${GREEN}●${RESET}  ${BOLD}Done${RESET}"
echo ""
echo -e "  ${BOLD}Next step${RESET}"
echo ""
echo -e "  Open your AI coding agent in this directory and enter:"
echo ""
echo -e "    ${CYAN}${ITALIC}Initialize the project based on @INIT_PROMPT.md${RESET}"
echo ""
