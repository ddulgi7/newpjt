extends Control
## 타이틀/로비 화면. 게임시작, 설정, 종료 버튼.

@onready var settings_panel: Panel = $SettingsPanel
@onready var music_slider: HSlider = $SettingsPanel/VBoxContainer/MusicSlider
@onready var sfx_slider: HSlider = $SettingsPanel/VBoxContainer/SFXSlider


func _ready() -> void:
	settings_panel.visible = false
	# 오디오 버스 현재 볼륨 반영
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_music_bus()))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(_sfx_bus()))


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
