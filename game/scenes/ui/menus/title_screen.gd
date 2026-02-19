extends Control
## 타이틀/로비 화면. 게임시작, 설정, 종료 버튼.
##
## [배경 이미지 교체]
##   res://assets/sprites/ui/title_bg.png 를 넣으면 자동 적용됩니다.
##
## [버튼 이미지 교체]
##   아래 경로에 PNG 파일을 넣으면 자동으로 버튼에 적용됩니다.
##   게임 시작 : res://assets/sprites/ui/btn_start.png
##   설정      : res://assets/sprites/ui/btn_settings.png
##   게임 종료 : res://assets/sprites/ui/btn_quit.png
##
##   각 버튼마다 hover/pressed 이미지도 지원합니다.
##   예) btn_start_hover.png, btn_start_pressed.png

@onready var start_button: TextureButton    = $VBoxContainer/StartButton
@onready var settings_button: TextureButton = $VBoxContainer/SettingsButton
@onready var quit_button: TextureButton     = $VBoxContainer/QuitButton
@onready var settings_panel: Panel          = $SettingsPanel
@onready var music_slider: HSlider          = $SettingsPanel/VBoxContainer/MusicSlider
@onready var sfx_slider: HSlider            = $SettingsPanel/VBoxContainer/SFXSlider
@onready var bg_color: ColorRect            = $Background
@onready var bg_image: TextureRect          = $BackgroundImage

const BG_TEXTURE_PATH := "res://assets/sprites/ui/title_bg.png"

# 버튼별 이미지 경로 (이 경로에 파일을 추가하면 자동 적용)
const BUTTON_TEXTURES := {
	"start": {
		"normal":  "res://assets/sprites/ui/btn_start.png",
		"hover":   "res://assets/sprites/ui/btn_start_hover.png",
		"pressed": "res://assets/sprites/ui/btn_start_pressed.png",
	},
	"settings": {
		"normal":  "res://assets/sprites/ui/btn_settings.png",
		"hover":   "res://assets/sprites/ui/btn_settings_hover.png",
		"pressed": "res://assets/sprites/ui/btn_settings_pressed.png",
	},
	"quit": {
		"normal":  "res://assets/sprites/ui/btn_quit.png",
		"hover":   "res://assets/sprites/ui/btn_quit_hover.png",
		"pressed": "res://assets/sprites/ui/btn_quit_pressed.png",
	},
}


func _ready() -> void:
	settings_panel.visible = false
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_music_bus()))
	sfx_slider.value   = db_to_linear(AudioServer.get_bus_volume_db(_sfx_bus()))
	_load_background()
	_load_button_textures()


# --- 배경 이미지 로드 ---

func _load_background() -> void:
	if ResourceLoader.exists(BG_TEXTURE_PATH):
		bg_image.texture = load(BG_TEXTURE_PATH)
		bg_image.visible = true
		bg_color.visible = false  # 이미지가 있으면 단색 배경 숨김


# --- 버튼 이미지 자동 로드 ---

func _load_button_textures() -> void:
	_apply_textures(start_button,    BUTTON_TEXTURES["start"])
	_apply_textures(settings_button, BUTTON_TEXTURES["settings"])
	_apply_textures(quit_button,     BUTTON_TEXTURES["quit"])


func _apply_textures(btn: TextureButton, paths: Dictionary) -> void:
	if ResourceLoader.exists(paths["normal"]):
		btn.texture_normal  = load(paths["normal"])
		btn.get_node("FallbackLabel").visible = false  # 이미지가 있으면 텍스트 숨김
	if ResourceLoader.exists(paths["hover"]):
		btn.texture_hover   = load(paths["hover"])
	if ResourceLoader.exists(paths["pressed"]):
		btn.texture_pressed = load(paths["pressed"])


# --- 버튼 콜백 ---

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_settings_button_pressed() -> void:
	settings_panel.visible = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()


# --- 설정 패널 ---

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_music_bus(), linear_to_db(value))
	AudioServer.set_bus_mute(_music_bus(), value < 0.01)


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_sfx_bus(), linear_to_db(value))
	AudioServer.set_bus_mute(_sfx_bus(), value < 0.01)


func _on_settings_close_pressed() -> void:
	settings_panel.visible = false


# --- 유틸 ---

func _music_bus() -> int:
	return AudioServer.get_bus_index("Music")


func _sfx_bus() -> int:
	return AudioServer.get_bus_index("SFX")
