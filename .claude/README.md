# .claude/

Claude Code 하네스 구성 뼈대입니다. 프로젝트별 동작을 커스터마이즈하려면 아래 항목을 수정·확장하세요.

| 경로 | 역할 |
|------|------|
| `settings.json` | 권한(allow/deny/ask), 훅, 환경변수 등 프로젝트 스코프 설정 |
| `commands/` | `/커맨드명` 으로 호출되는 슬래시 명령 프롬프트. 파일명이 곧 명령명 |
| `agents/` | 특정 역할을 수행하는 서브에이전트 정의 |
| `skills/<name>/SKILL.md` | 작업 맥락에서 자동 로드되는 지식/지침 번들 |
| `hooks/` | `PreToolUse`/`PostToolUse` 등 이벤트에 실행되는 셸 스크립트 |
