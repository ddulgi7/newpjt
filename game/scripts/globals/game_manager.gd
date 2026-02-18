extends Node
## Manages global game state, save/load, and scene transitions.
## Autoloaded as "GameManager".

enum GameState { EXPLORING, BATTLE, DIALOG, MENU, CUTSCENE }

var current_state: GameState = GameState.EXPLORING
var player_data: Dictionary = {
	"name": "Trainer",
	"party": [],       # Array of monster dictionaries
	"inventory": [],    # Array of item dictionaries
	"money": 3000,
	"badges": [],
	"position": Vector2.ZERO,
	"current_map": "town_start",
}

const SAVE_PATH := "user://save_data.json"
const MAX_PARTY_SIZE := 6

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


# --- State Management ---

func change_state(new_state: GameState) -> void:
	current_state = new_state


func is_player_controllable() -> bool:
	return current_state == GameState.EXPLORING


# --- Party Management ---

func add_monster_to_party(monster: Dictionary) -> bool:
	if player_data.party.size() >= MAX_PARTY_SIZE:
		return false
	player_data.party.append(monster)
	Events.party_changed.emit()
	return true


func get_party() -> Array:
	return player_data.party


# --- Save / Load ---

func save_game() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(player_data, "\t"))
		file.close()
		Events.game_saved.emit()


func load_game() -> bool:
	if not FileAccess.file_exists(SAVE_PATH):
		return false
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		return false
	var json := JSON.new()
	if json.parse(file.get_as_text()) == OK:
		player_data = json.data
		Events.game_loaded.emit()
		return true
	return false


# --- Scene Transition ---

func transition_to_scene(scene_path: String) -> void:
	change_state(GameState.CUTSCENE)
	get_tree().change_scene_to_file(scene_path)
	change_state(GameState.EXPLORING)
