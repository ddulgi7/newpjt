# 이미지 에셋 목록

> 모든 이미지는 픽셀아트 스타일, 16x16 또는 32x32 타일 기반.
> 캐릭터/몬스터 스프라이트시트는 4방향(상/하/좌/우) x 프레임 수로 구성.

---

## 1. 플레이어 (`sprites/characters/`)

### 필드 이동
- [ ] `player_walk.png` — 걷기 스프라이트시트 (4방향 x 4프레임)
- [ ] `player_idle.png` — 대기 스프라이트시트 (4방향 x 2프레임)
- [ ] `player_run.png` — 달리기 스프라이트시트 (4방향 x 4프레임)

### 배틀
- [ ] `player_battle_back.png` — 배틀 시 플레이어 뒷모습
- [ ] `player_portrait.png` — 메뉴/대화 초상화

---

## 2. NPC (`sprites/characters/`)

### 마을 NPC
- [ ] `npc_elder.png` — 마을 촌장 (4방향 x 2프레임)
- [ ] `npc_nurse.png` — 힐러/간호사 (4방향 x 2프레임)
- [ ] `npc_shopkeeper.png` — 상점 주인 (4방향 x 2프레임)
- [ ] `npc_villager_01.png` — 마을 주민 1 (4방향 x 2프레임)
- [ ] `npc_villager_02.png` — 마을 주민 2 (4방향 x 2프레임)

### 특수 NPC
- [ ] `npc_rival.png` — 라이벌 (4방향 x 4프레임)
- [ ] `npc_professor.png` — 박사/연구원 (4방향 x 2프레임)
- [ ] `npc_trainer_01.png` — 트레이너 1 (4방향 x 4프레임)
- [ ] `npc_trainer_02.png` — 트레이너 2 (4방향 x 4프레임)

### 배틀용
- [ ] `npc_rival_battle.png` — 라이벌 배틀 앞모습
- [ ] `npc_trainer_01_battle.png` — 트레이너 1 배틀 앞모습
- [ ] `npc_trainer_02_battle.png` — 트레이너 2 배틀 앞모습

---

## 3. 몬스터 (`sprites/monsters/`)

### 스타터 몬스터
- [ ] `flame_pup.png` — Flame Pup 필드 아이콘 (32x32)
- [ ] `flame_pup_front.png` — 배틀 앞모습 (64x64)
- [ ] `flame_pup_back.png` — 배틀 뒷모습 (64x64)
- [ ] `flame_hound.png` — Flame Hound (진화) 필드 아이콘
- [ ] `flame_hound_front.png` — 배틀 앞모습
- [ ] `flame_hound_back.png` — 배틀 뒷모습

- [ ] `aqua_turtle.png` — Aqua Turtle 필드 아이콘 (32x32)
- [ ] `aqua_turtle_front.png` — 배틀 앞모습 (64x64)
- [ ] `aqua_turtle_back.png` — 배틀 뒷모습 (64x64)
- [ ] `aqua_tortoise.png` — Aqua Tortoise (진화) 필드 아이콘
- [ ] `aqua_tortoise_front.png` — 배틀 앞모습
- [ ] `aqua_tortoise_back.png` — 배틀 뒷모습

- [ ] `leaf_sprout.png` — Leaf Sprout 필드 아이콘 (32x32)
- [ ] `leaf_sprout_front.png` — 배틀 앞모습 (64x64)
- [ ] `leaf_sprout_back.png` — 배틀 뒷모습 (64x64)
- [ ] `leaf_bloom.png` — Leaf Bloom (진화) 필드 아이콘
- [ ] `leaf_bloom_front.png` — 배틀 앞모습
- [ ] `leaf_bloom_back.png` — 배틀 뒷모습

### 야생 몬스터
- [ ] `wild_rat.png` — 야생 쥐 필드 아이콘
- [ ] `wild_rat_front.png` — 배틀 앞모습
- [ ] `wild_rat_back.png` — 배틀 뒷모습
- [ ] `wild_bird.png` — 야생 새 필드 아이콘
- [ ] `wild_bird_front.png` — 배틀 앞모습
- [ ] `wild_bird_back.png` — 배틀 뒷모습
- [ ] `wild_bug.png` — 야생 벌레 필드 아이콘
- [ ] `wild_bug_front.png` — 배틀 앞모습
- [ ] `wild_bug_back.png` — 배틀 뒷모습
- [ ] `wild_slime.png` — 야생 슬라임 필드 아이콘
- [ ] `wild_slime_front.png` — 배틀 앞모습
- [ ] `wild_slime_back.png` — 배틀 뒷모습

---

## 4. 맵 타일셋 (`sprites/tilesets/`)

### 마을
- [ ] `tileset_town.png` — 마을 타일셋
  - 잔디, 흙길, 돌바닥
  - 집/건물 외벽, 지붕
  - 울타리, 나무, 꽃, 우물
  - 문, 계단, 표지판
  - 힐링센터, 상점 건물

### 야생 지역
- [ ] `tileset_wild_grass.png` — 풀숲 지역 타일셋
  - 풀숲 (야생 몬스터 조우 영역)
  - 나무, 덤불, 바위
  - 오솔길, 흙길
- [ ] `tileset_wild_cave.png` — 동굴 타일셋
  - 동굴 벽, 바닥
  - 바위, 물웅덩이
  - 입구/출구

### 실내
- [ ] `tileset_interior.png` — 실내 공통 타일셋
  - 바닥, 벽, 카펫
  - 가구 (테이블, 의자, 침대, 책장)
  - 문, 계단
- [ ] `tileset_heal_center.png` — 힐링센터 전용
  - 카운터, 힐링 머신
- [ ] `tileset_shop.png` — 상점 전용
  - 진열대, 카운터

---

## 5. UI (`sprites/ui/` 폴더 추가 필요)

### 배틀 UI
- [ ] `battle_bg_grass.png` — 배틀 배경 (풀숲)
- [ ] `battle_bg_cave.png` — 배틀 배경 (동굴)
- [ ] `battle_platform_player.png` — 아군 발판
- [ ] `battle_platform_enemy.png` — 적군 발판
- [ ] `hp_bar.png` — HP 바 프레임
- [ ] `exp_bar.png` — 경험치 바 프레임
- [ ] `type_icons.png` — 타입 아이콘 시트 (fire/water/grass/normal 등)

### 타이틀 화면 (경로: `sprites/ui/`)
> 파일을 해당 경로에 넣으면 게임 실행 시 자동 적용됩니다.

- [ ] `title_bg.png` — 타이틀 화면 배경 이미지 (480x854 권장)

### 인트로 시퀀스
- [ ] `sprites/characters/npc_professor.png` — 박사 전신 이미지 (180x280 권장)
- [ ] `sprites/monsters/intro_pokemon.png` — 인트로에 등장하는 포켓몬 (200x200 권장)

### 타이틀 화면 버튼 (경로: `sprites/ui/`)

- [ ] `btn_start.png` — 게임 시작 버튼 기본
- [ ] `btn_start_hover.png` — 게임 시작 버튼 호버 (선택사항)
- [ ] `btn_start_pressed.png` — 게임 시작 버튼 눌림 (선택사항)
- [ ] `btn_settings.png` — 설정 버튼 기본
- [ ] `btn_settings_hover.png` — 설정 버튼 호버 (선택사항)
- [ ] `btn_settings_pressed.png` — 설정 버튼 눌림 (선택사항)
- [ ] `btn_quit.png` — 게임 종료 버튼 기본
- [ ] `btn_quit_hover.png` — 게임 종료 버튼 호버 (선택사항)
- [ ] `btn_quit_pressed.png` — 게임 종료 버튼 눌림 (선택사항)

### 메뉴 UI
- [ ] `menu_frame.png` — 메뉴 프레임/윈도우 9-patch
- [ ] `dialog_frame.png` — 대화창 프레임 9-patch
- [ ] `cursor.png` — 메뉴 커서

### 아이콘
- [ ] `icon_potion.png` — 포션 아이콘
- [ ] `icon_capture_ball.png` — 포획볼 아이콘
- [ ] `icon_antidote.png` — 해독제 아이콘
- [ ] `icon_revive.png` — 부활 아이콘
- [ ] `icon_badge_01.png` — 뱃지 1
- [ ] `icon_badge_02.png` — 뱃지 2

### HUD
- [ ] `dpad.png` — 가상 D-패드 (모바일 터치 조작)
- [ ] `btn_a.png` — A 버튼 (상호작용)
- [ ] `btn_b.png` — B 버튼 (취소)
- [ ] `btn_menu.png` — 메뉴 버튼

---

## 6. 이펙트 (`sprites/effects/`)

### 배틀 이펙트
- [ ] `fx_hit_normal.png` — 일반 타격 이펙트 시트
- [ ] `fx_fire.png` — 불꽃 이펙트 시트
- [ ] `fx_water.png` — 물 이펙트 시트
- [ ] `fx_grass.png` — 풀 이펙트 시트
- [ ] `fx_capture.png` — 포획볼 던지기/흔들림 시트

### 필드 이펙트
- [ ] `fx_grass_rustle.png` — 풀숲 흔들림
- [ ] `fx_transition.png` — 화면 전환 효과

---

## 참고사항
- 권장 포맷: **PNG** (투명 배경)
- 캐릭터 스프라이트: **32x32** 기본 크기
- 배틀 몬스터: **64x64** 이상 권장
- 타일셋: **16x16** 타일 단위
- UI 프레임: **9-patch** 지원 형태로 제작
- 모든 에셋은 2의 배수 해상도 유지
