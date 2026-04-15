---
description: DOCS.md 규약대로 새 docs/ 문서를 스캐폴딩합니다
argument-hint: <type: plan|execution|decision|meeting|deliverable|retro|reference> <제목>
---

당신은 이 프로젝트의 **docs/ 문서 스크라이브**입니다. `DOCS.md` 규약을 **엄격히** 따릅니다.

## 입력
$ARGUMENTS

- 첫 토큰: 문서 유형 (`plan`/`execution`/`decision`/`meeting`/`deliverable`/`retro`/`reference`)
- 나머지: 문서 제목

입력이 불완전하면 사용자에게 되묻습니다.

## 절차

1. **카테고리 매핑**:
   - `plan` → `10-plan/drafts/` (draft:true)
   - `execution` → `20-execution/logs/`
   - `decision` → `20-execution/decisions/`
   - `meeting` → `20-execution/meetings/`
   - `deliverable` → `30-deliverables/`
   - `retro` → `40-retros/`
   - `reference` → `90-reference/`

2. **파일명 결정**: `YYYY-MM-DD-NNN-kebab-title.md`
   - 오늘 날짜 사용
   - 해당 카테고리 내 같은 날짜의 기존 파일을 확인해 **다음 NNN** 계산 (3자리, 001부터)
   - 제목을 영문 kebab-case로 변환 (한글 제목이면 slug와 동일 규칙 적용)

3. **프런트매터 생성** (DOCS.md §3):
   ```yaml
   ---
   title: "<원본 제목>"
   sidebar_label: "[YYYY/MM/DD-NNN] <짧은 제목>"
   slug: <한글/공백/특수문자 포함 시 kebab-case slug>
   tags:
     - <plan|execution|decision|meeting|deliverable|retro|reference>
   draft: <plan이면 true, 그 외 false>
   ---
   ```

4. **유형별 필수 섹션** 삽입 (DOCS.md §6):
   - plan: 배경 / 목표 / 비목표 / 범위 / 마일스톤 / 리스크 / 미해결 이슈 / 관련 문서
   - execution: 기간 / 진행 내용 / 계획 대비 상태 / 블로커 / 다음 액션
   - decision: 배경 / 결정 사항 / 고려한 대안 / 영향 / 후속 작업
   - meeting: 참석자 / 안건 / 논의 내용 / 결정 사항 / 액션 아이템
   - 그 외: 요약 3~6줄 + 자유 구조

5. **파일 생성 후 확인**: `grep -nP '\xef\xbf\xbd' <파일>`로 UTF-8 깨짐(U+FFFD) 검증.

## 보고

- 생성된 경로
- 계산된 NNN과 그 근거 (같은 날짜 기존 파일 개수)
- 다음 단계 제안 (예: plan이면 `/docs-approve`로 승인 가능)
