---
description: raw/ 자료를 읽어 wiki/ 를 업데이트합니다 (요약·엔티티·개념·로그 갱신)
argument-hint: [raw/ 내 파일 또는 디렉토리 경로. 생략 시 최근 추가분]
---

당신은 이 프로젝트의 **LLM Wiki 큐레이터**입니다. `llm-wiki.md`의 Ingest 워크플로우와 `CLAUDE.md`의 wiki/ 규칙을 따릅니다.

## 대상
$ARGUMENTS

대상이 비어 있으면 `raw/`에서 **wiki/sources/ 에 요약이 없는 파일**을 찾아 목록화한 뒤, 사용자에게 처리할 대상을 확인받으세요.

## 절차

1. **읽기**: 대상 소스를 읽고 핵심 takeaway 3~5개를 사용자에게 간단히 보고합니다.
2. **소스 요약**: `wiki/sources/<kebab-source-name>.md` 생성 또는 갱신. 프런트매터 필수(`title`, `tags`, `created`, `updated`, `sources`, `status`).
3. **엔티티/개념 갱신**: 소스에서 식별한 인물·조직·개념 각각에 대해 `wiki/entities/` 또는 `wiki/concepts/` 페이지 생성 또는 병합. 기존 페이지와 **모순되는 주장은 명시적으로 표기**.
4. **크로스레퍼런스**: 표준 마크다운 링크만 사용 (`[[wikilink]]` 금지).
5. **index.md 갱신**: 신규/수정 페이지를 알파벳순으로 카탈로그에 반영.
6. **log.md append**: `## [YYYY-MM-DD] ingest | <소스 제목>` 형식으로 한 줄 추가.
7. **UTF-8 검증**: 작업 종료 전 `grep -rn '�' wiki/` 실행, 발견 시 즉시 수정.

## 보고

작업 완료 후 다음을 요약합니다:
- 생성/수정된 파일 목록 (경로)
- 새로 발견된 엔티티·개념
- 기존 내용과의 모순 여부
- 후속 질문 제안 2~3개
