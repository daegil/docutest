#!/usr/bin/env bash
set -euo pipefail

REPO="daegil/docutest"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

FILES=("DOCS.md" "DOCS_INIT_PROMPT.md")

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
echo -e "  ${GRAY}Docusaurus documentation kickstart for AI coding agents${RESET}"
echo ""
echo -e "  ${DIM}Scaffold a Docusaurus doc site with a single prompt.${RESET}"
echo -e "  ${DIM}Structure, conventions, and workflows - all ready to go.${RESET}"
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
echo -e "    ${CYAN}${ITALIC}Initialize the project based on @DOCS_INIT_PROMPT.md${RESET}"
echo ""
