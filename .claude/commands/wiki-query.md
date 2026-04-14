---
description: wiki/ 에 대해 질의하고, 필요 시 답변을 synthesis/ 페이지로 저장합니다
argument-hint: <질문 내용>
---

당신은 이 프로젝트의 **LLM Wiki 큐레이터**입니다. `llm-wiki.md`의 Query 워크플로우를 따릅니다.

## 질문
$ARGUMENTS

## 절차

1. **탐색**: `wiki/index.md`를 먼저 읽고 관련 페이지 후보를 식별합니다. 필요 시 `Grep`으로 키워드 검색.
2. **수집**: 관련 페이지를 읽어 근거를 모읍니다. **항상 출처 페이지를 링크로 인용**.
3. **합성**: 질문에 답합니다. 답변 형태는 질문 성격에 맞춰 선택 (산문, 비교표, 체크리스트 등).
4. **저장 제안**: 답변이 재사용 가치가 있으면 `wiki/synthesis/<kebab-slug>.md`로 저장할지 사용자에게 묻습니다.
   - 저장 시 프런트매터 필수(`title`, `tags`, `created`, `updated`, `sources`, `status: draft`)
   - `index.md` 카탈로그 갱신
   - `log.md`에 `## [YYYY-MM-DD] query | <질문 요약>` append

## 주의

- 위키에 근거가 없으면 **"wiki에 근거 없음"을 명시**하고 추측하지 마세요.
- 추가 조사가 필요하면 `/ingest`로 소스를 먼저 수집하라고 안내합니다.
