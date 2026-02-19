extends Control
## 포켓몬 스타일 게임 인트로 시퀀스.
##
## 이미지 교체 경로:
##   박사   : res://assets/sprites/characters/npc_professor.png
##   포켓몬 : res://assets/sprites/monsters/intro_pokemon.png

const CHAR_DELAY       := 0.035  # 글자당 출력 간격 (초)
const PROFESSOR_IMG    := "res://assets/sprites/characters/npc_professor.png"
const POKEMON_IMG      := "res://assets/sprites/monsters/intro_pokemon.png"

# 대화 단계 정의
# show: "professor" | "pokemon" | "player"
const DIALOG_STEPS: Array[Dictionary] = [
	{"show": "professor", "text": "안녕! 포켓몬의 세계에 온 걸 환영해!\n나는 포켓몬을 연구하는 박사야!"},
	{"show": "professor", "text": "이 넓은 세상에는 '포켓몬'이라 불리는\n신비한 생물들이 살고 있지!"},
	{"show": "pokemon",   "text": "짜잔~ 이 친구가 바로 포켓몬이야!\n귀엽지? 강하기도 하고!"},
	{"show": "professor", "text": "포켓몬을 모으고, 키우고, 배틀하는 것이\n트레이너의 꿈이거든!"},
	{"show": "player",    "text": "...그런데 말이야, 너는 누구니?\n이 모험을 함께 할 트레이너가 바로 너야!"},
	{"show": "professor", "text": "아, 실례했어. 먼저 이름을 알려줄래?"},
]

@onready var professor_display: TextureRect  = $CharacterArea/ProfessorDisplay
@onready var professor_fallback: Label       = $CharacterArea/ProfessorDisplay/FallbackLabel
@onready var pokemon_display: TextureRect    = $CharacterArea/PokemonDisplay
@onready var pokemon_fallback: Label         = $CharacterArea/PokemonDisplay/FallbackLabel
@onready var player_display: Control         = $CharacterArea/PlayerDisplay
@onready var dialog_box: Panel               = $DialogBox
@onready var dialog_text: RichTextLabel      = $DialogBox/Margin/VBox/DialogText
@onready var continue_arrow: Label           = $DialogBox/Margin/VBox/ContinueArrow
@onready var name_input_panel: Panel         = $NameInputPanel
@onready var name_line_edit: LineEdit        = $NameInputPanel/VBox/NameLineEdit
@onready var fade_overlay: ColorRect         = $FadeOverlay

var _step: int       = 0
var _is_typing: bool = false
var _can_advance: bool = false
var _blink_tween: Tween


func _ready() -> void:
	_hide_all()
	_load_images()
	fade_overlay.color = Color(0, 0, 0, 1)
	await _fade(0.0, 1.5)
	await get_tree().create_timer(0.4).timeout
	await _play_step()


func _unhandled_input(event: InputEvent) -> void:
	if not _can_advance:
		return
	if event.is_action_just_pressed("interact") or event.is_action_just_pressed("ui_accept") \
			or (event is InputEventMouseButton and event.pressed):
		if _is_typing:
			_skip_typing()
		else:
			_can_advance = false
			continue_arrow.visible = false
			if _blink_tween:
				_blink_tween.kill()
			_step += 1
			await _play_step()
		get_viewport().set_input_as_handled()


# --- 단계 진행 ---

func _play_step() -> void:
	if _step >= DIALOG_STEPS.size():
		await _show_name_input()
		return

	var step: Dictionary = DIALOG_STEPS[_step]
	await _show_character(step["show"])
	dialog_box.visible = true
	await _typewrite(step["text"])
	_can_advance = true
	continue_arrow.visible = true
	_blink_arrow()


# --- 캐릭터 전환 ---

func _show_character(who: String) -> void:
	var current := _current_character()
	if current == who:
		return

	if current != "":
		await _fade(1.0, 0.35)
		_hide_all_characters()

	match who:
		"professor": professor_display.visible = true
		"pokemon":   pokemon_display.visible   = true
		"player":    player_display.visible    = true

	await _fade(0.0, 0.35)


func _current_character() -> String:
	if professor_display.visible: return "professor"
	if pokemon_display.visible:   return "pokemon"
	if player_display.visible:    return "player"
	return ""


func _hide_all_characters() -> void:
	professor_display.visible = false
	pokemon_display.visible   = false
	player_display.visible    = false


func _hide_all() -> void:
	_hide_all_characters()
	dialog_box.visible       = false
	name_input_panel.visible = false
	continue_arrow.visible   = false


# --- 타이프라이터 효과 ---

func _typewrite(text: String) -> void:
	_is_typing = true
	_can_advance = true
	dialog_text.text = text
	dialog_text.visible_ratio = 0.0
	var tween := create_tween()
	tween.tween_property(dialog_text, "visible_ratio", 1.0, text.length() * CHAR_DELAY)
	await tween.finished
	_is_typing = false


func _skip_typing() -> void:
	dialog_text.visible_ratio = 1.0
	_is_typing = false
	continue_arrow.visible = true
	_blink_arrow()


# --- 화살표 깜빡임 ---

func _blink_arrow() -> void:
	if _blink_tween:
		_blink_tween.kill()
	_blink_tween = create_tween().set_loops()
	_blink_tween.tween_property(continue_arrow, "modulate:a", 0.1, 0.45)
	_blink_tween.tween_property(continue_arrow, "modulate:a", 1.0, 0.45)


# --- 페이드 ---

func _fade(target_alpha: float, duration: float) -> void:
	fade_overlay.visible = true
	var tween := create_tween()
	tween.tween_property(fade_overlay, "color:a", target_alpha, duration)
	await tween.finished
	if target_alpha == 0.0:
		fade_overlay.visible = false


# --- 이름 입력 ---

func _show_name_input() -> void:
	dialog_box.visible = false
	_hide_all_characters()
	await _fade(1.0, 0.5)
	name_input_panel.visible = true
	await _fade(0.0, 0.5)
	name_line_edit.grab_focus()


func _on_confirm_button_pressed() -> void:
	var player_name := name_line_edit.text.strip_edges()
	if player_name.is_empty():
		player_name = "트레이너"
	GameManager.player_data["name"] = player_name
	await _fade(1.0, 0.8)
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_name_line_edit_text_submitted(_text: String) -> void:
	_on_confirm_button_pressed()


# --- 이미지 로드 ---

func _load_images() -> void:
	if ResourceLoader.exists(PROFESSOR_IMG):
		professor_display.texture  = load(PROFESSOR_IMG)
		professor_fallback.visible = false
	if ResourceLoader.exists(POKEMON_IMG):
		pokemon_display.texture  = load(POKEMON_IMG)
		pokemon_fallback.visible = false
