extends CharacterBody2D
## Player character with 4-directional top-down movement.

@export var speed: float = 120.0

var facing_direction: Vector2 = Vector2.DOWN

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var interaction_ray: RayCast2D = $InteractionRay


func _physics_process(_delta: float) -> void:
	if not GameManager.is_player_controllable():
		velocity = Vector2.ZERO
		return

	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

	if input_dir != Vector2.ZERO:
		_update_facing(input_dir)
		Events.player_moved.emit(global_position)

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if not GameManager.is_player_controllable():
		return

	if event.is_action_pressed("interact"):
		_try_interact()

	if event.is_action_pressed("menu"):
		Events.menu_opened.emit("pause")


func _update_facing(direction: Vector2) -> void:
	# Snap to dominant axis for 4-directional movement
	if abs(direction.x) > abs(direction.y):
		facing_direction = Vector2.RIGHT if direction.x > 0 else Vector2.LEFT
	else:
		facing_direction = Vector2.DOWN if direction.y > 0 else Vector2.UP

	interaction_ray.target_position = facing_direction * 16
	Events.player_direction_changed.emit(facing_direction)


func _try_interact() -> void:
	interaction_ray.force_raycast_update()
	if interaction_ray.is_colliding():
		var collider = interaction_ray.get_collider()
		if collider.has_method("interact"):
			collider.interact()
	Events.player_interacted.emit()
