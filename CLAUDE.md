# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

포켓몬스터 스타일의 탑다운 2D RPG. Android 앱으로 배포하며, 싱글플레이어로 시작 후 멀티플레이어 확장 예정.

## Tech Stack

- **Engine**: Godot 4.x (Mobile renderer)
- **Language**: GDScript
- **Target**: Android (APK/AAB)
- **Backend** (예정): Firebase (Auth, Firestore, Cloud Functions)
- **Resolution**: 480x854 (portrait, keep_height stretch)

## Build & Run

```bash
# Godot Editor에서 프로젝트 열기
# 1. Godot 4.x 설치: https://godotengine.org/download
# 2. Godot Editor 실행 → Import → game/project.godot 선택
# 3. F5로 실행 (메인 씬: scenes/main/main.tscn)

# Android 빌드
# 1. Editor Settings → Android SDK 경로 설정
# 2. Project → Export → Android 프리셋 → keystore 설정
# 3. Export Project → APK/AAB 생성
```

## Architecture

```
game/
├── project.godot          # 프로젝트 설정 (오토로드, 입력 매핑, 렌더러)
├── scenes/                # 씬 파일 (.tscn) + 씬 스크립트 (.gd)
│   ├── main/              # 게임 진입점
│   ├── player/            # 플레이어 (CharacterBody2D, 4방향 이동)
│   ├── monsters/          # 몬스터 씬
│   ├── npcs/              # NPC 씬
│   ├── levels/            # 맵 (town/, wild/)
│   ├── battle/            # 턴제 배틀 시스템
│   └── ui/                # UI (hud/, menus/, dialogs/)
├── scripts/
│   ├── globals/           # 오토로드: GameManager, Events (시그널 버스)
│   ├── systems/           # 핵심 시스템 (combat, inventory, save/load)
│   └── utils/             # 유틸리티
├── assets/                # 스프라이트, 오디오, 폰트, 셰이더
├── data/                  # JSON 데이터 (monsters.json, items.json, dialogues/)
├── addons/                # 서드파티 플러그인
└── tests/                 # 테스트
```

**핵심 설계**:
- **Signal Bus 패턴**: `Events` 오토로드를 통해 시스템 간 느슨한 결합
- **GameManager**: 전역 상태 관리 (GameState enum), 세이브/로드, 씬 전환
- **JSON 기반 데이터**: 몬스터, 아이템, 대화 데이터를 JSON으로 분리

## Rules

- Always use context7 MCP to look up the latest documentation before writing or modifying code. For every library or framework involved, call `resolve-library-id` then `query-docs` to get up-to-date usage examples.
- TODO 리스트를 상시 확인한다. Today 항목 중 완료된 작업이 있으면 `[x]`로 체크하고 Done으로 이동한 뒤, 관련 변경사항을 git에 커밋할지 사용자에게 물어본다.
- 작업이 완료되면 `docs/YYYY-MM-DD.md` 파일에 일자별 완료 기록을 작성한다.
- Multi Agent 실행 기준 (토큰 효율 고려):
  - **문서/설정만 변경** → 에이전트 실행 스킵
  - **소스 코드 변경 시** → Code Reviewer + Security Agent 실행 (commit 전 사용자 확인)
  - **기능/모듈 단위 완성 시** → Code Reviewer + Security Agent + Test Automator 모두 실행
  - **보안 민감 변경 시** (인증, API키, 권한 등) → Security Agent 단독 실행 가능

## TODO

### Backlog
- [ ] 배틀 시스템 구현 (턴제 전투, 타입 상성, 데미지 계산)
- [ ] 몬스터 포획 시스템
- [ ] 인벤토리 & 아이템 사용
- [ ] NPC 대화 시스템
- [ ] 타일맵 기반 맵 제작 (시작 마을, 야생 지역)
- [ ] UI 구현 (HUD, 배틀 UI, 메뉴, 대화창)
- [ ] 몬스터 진화 시스템
- [ ] 세이브/로드 시스템 완성
- [ ] 오디오 시스템 (BGM, SFX)
- [ ] Firebase 연동 (Auth, 데이터 동기화)
- [ ] 멀티플레이어 기초 설계
- [ ] Android 빌드 & 테스트

### Today (2026-02-18)
- [x] Godot 4 프로젝트 세팅

### Done
- [x] Godot 4 프로젝트 세팅 (2026-02-18)
  - [x] project.godot (2D Mobile 렌더러, Android 해상도, 입력 매핑)
  - [x] 폴더 구조 생성 (scenes, scripts, assets, data)
  - [x] 핵심 스크립트 (GameManager, Events, Player)
  - [x] 게임 데이터 JSON 템플릿 (monsters, items)
- [x] Multi Agent 구축 (2026-02-18)
  - [x] Code Reviewer — `.claude/agents/code-reviewer.md`
  - [x] Security Agent — `.claude/agents/security-agent.md`
  - [x] Test Automator — `.claude/agents/test-automator.md`
- [x] Context7 MCP 연동 (2026-02-17)
- [x] GitHub MCP 연동 (2026-02-17)
- [x] GitHub 저장소 생성 및 push (2026-02-17)
