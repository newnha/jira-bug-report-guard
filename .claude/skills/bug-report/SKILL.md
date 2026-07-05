---
name: bug-report
description: 사용자가 버그 현상이나 오류 증상을 설명하면서 Jira 등록용 버그 리포트 작성을 원할 때 사용한다. "버그 리포트 써줘", "이슈 등록용으로 정리해줘", "이 현상 리포트로 만들어줘" 같은 요청이 트리거다. 정해진 필수 필드(Priority/Severity/Frequency/Component/Phase/Environment)를 갖춘 표준 양식으로 작성한다.
---

# Bug Report 작성 스킬

버그 현상 설명을 입력받아, 아래 고정 양식으로 Jira 등록용 리포트를 작성한다.

## 작성 전 필수 확인 (질문 우선)
다음 정보가 없으면 리포트를 작성하지 말고 먼저 질문한다:
- 재현 스텝 (최소 1단계)
- Environment (OS/단말기/빌드 중 최소 하나)
- 발생 Phase (DEV/SANDBOX/CBT/PRODUCTION)
정보가 충분해지면 그때 작성한다.

## 출력 양식 (반드시 이 형식)
Summary : [기능경로] > [액션] 시, [현상]되는 현상
Priority : (Highest~Lowest 중 추천 + 이유)
Severity : (Critical~Trivial 중 추천 + 이유)
Frequency : (Always~Rarely 중 추천 + 이유)
Component : (관련 기능/조직, 불명확하면 질문)
Phase : (DEV/SANDBOX/CBT/PRODUCTION)
Environment : [OS] 단말기 (버전) / [빌드]

Description :
[사전조건] (없으면 생략)
[재현스텝] 1. 2. 3.
[실행결과]
[기대결과]
[참고사항] (없으면 생략)

## 작성 규칙
- Summary는 반드시 "[기능경로] > [액션] 시, [현상]" 패턴을 지킨다
- 재현스텝은 최소 단계로 단순화한다
- 사전조건·재현스텝 어미를 통일한다
- 완성된 리포트는 `output/bug-report.md` 파일로 저장한다
- Priority 값이 불명확하면 기본값 Medium으로 채운다
- Frequency 값이 불명확하면 기본값 Always로 채운다
- Phase는 반드시 DEV / SANDBOX / CBT / PRODUCTION 중 하나로만 기입한다
- Severity는 반드시 Critical / Major / Minor / Trivial 중 하나로만 기입한다
- Priority는 반드시 Highest / High / Medium / Low / Lowest 중 하나로만 기입한다
- Frequency는 반드시 Always / Often / Sometimes / Rarely 중 하나로만 기입한다
