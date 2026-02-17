# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

<!-- Describe what this project does -->

## Tech Stack

<!-- Languages, frameworks, key dependencies -->

## Build & Run

<!-- Commands to build, run, test, lint -->

## Architecture

<!-- High-level structure and key design decisions -->

## Rules

- Always use context7 MCP to look up the latest documentation before writing or modifying code. For every library or framework involved, call `resolve-library-id` then `query-docs` to get up-to-date usage examples.
- TODO 리스트를 상시 확인한다. Today 항목 중 완료된 작업이 있으면 `[x]`로 체크하고 Done으로 이동한 뒤, 관련 변경사항을 git에 커밋할지 사용자에게 물어본다.
- 작업이 완료되면 `docs/YYYY-MM-DD.md` 파일에 일자별 완료 기록을 작성한다.
- git commit 전에 Code Reviewer와 Security Agent 실행 여부를 사용자에게 확인한다.
- Test Automator는 작업 세그먼트(기능 단위 또는 모듈 단위) 완료 시 병렬로 실행한다.

## TODO

### Backlog
- [ ] Multi Agent 구축
  - [ ] Code Reviewer — 코드 비효율 확인 및 리팩토링. git commit 전에 CR 진행 여부를 사용자에게 확인
  - [ ] Security Agent — 코드 보안 취약점 점검. CR 진행 시 함께 실행
  - [ ] Test Automator — 단위/통합 테스트 자동 생성 및 실행. 작업 세그먼트 완료 시 병렬로 진행

### Today (2026-02-17)
<!-- 금일 진행할 항목 -->

### Done
- [x] Context7 MCP 연동 (2026-02-17)
- [x] GitHub MCP 연동 (2026-02-17)
- [x] GitHub 저장소 생성 및 push (2026-02-17)
