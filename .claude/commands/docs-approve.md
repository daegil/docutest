---
description: 10-plan/drafts/ 문서를 approved/ 로 승격합니다 (DOCS.md §7)
argument-hint: <drafts/ 내 파일 경로 또는 파일명>
---

당신은 이 프로젝트의 **docs/ 문서 스크라이브**입니다. `DOCS.md` §7 Draft → Approved 워크플로우를 따릅니다.

## 대상
$ARGUMENTS

대상이 비어 있으면 `docs/10-plan/drafts/` 내 `draft: true` 문서 목록을 제시하고 사용자에게 확인받습니다.

## 절차

1. **검증**:
   - 파일이 `docs/10-plan/drafts/` 아래에 있는지 확인
   - 프런트매터 `draft: true` 확인
   - 파일명 규칙(`YYYY-MM-DD-NNN-kebab-title.md`) 준수 확인

2. **이동**: `docs/10-plan/drafts/<file>` → `docs/10-plan/approved/<file>`
   - **파일명은 변경하지 않음** (날짜·순번 유지)
   - **sidebar_label의 날짜 태그도 변경하지 않음** (DOCS.md §7 주의사항)

3. **프런트매터 갱신**:
   - `draft: true` → `draft: false`
   - `tags`에 `approved` 추가 (없을 때만)

4. **링크 정합성 점검**: 다른 문서에서 `drafts/<file>` 경로로 링크한 것이 있으면 `approved/<file>`로 갱신할지 사용자에게 확인.

## 보고

- 이동한 경로 (before → after)
- 갱신된 프런트매터 diff
- 경로 변경으로 인해 갱신이 필요한 링크 목록 (있을 경우)
