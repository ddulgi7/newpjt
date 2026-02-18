extends Node
## Signal bus for decoupled communication between game systems.
## Autoloaded as "Events".

# Player signals
signal player_moved(position: Vector2)
signal player_direction_changed(direction: Vector2)
signal player_interacted()

# Battle signals
signal battle_started(wild_monster_data: Dictionary)
signal battle_ended(result: String)  # "win", "lose", "flee"
signal attack_performed(attacker: String, target: String, damage: int)

# Monster signals
signal monster_captured(monster_data: Dictionary)
signal monster_healed(monster_id: String)
signal party_changed()

# UI signals
signal dialog_started(dialog_id: String)
signal dialog_ended()
signal menu_opened(menu_name: String)
signal menu_closed(menu_name: String)

# Game state signals
signal game_saved()
signal game_loaded()
signal scene_transition_requested(target_scene: String, spawn_point: String)
