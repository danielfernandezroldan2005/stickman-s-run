extends CharacterBody2D

@export var speed: float = 300
@export var jump_velocity: float = 400
@export var gravity: float = 980
@export var coyote_durantion: float = 0.15
@export var jump_buffer_duration: float = 0.12

var coyote_timer: float = 0.0
var jump_buffer_timer: float = 0.0 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		coyote_timer -= delta
	else:
		coyote_timer = coyote_durantion

	# Handle Input and Buffer.
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer_timer = jump_buffer_duration
	else:
		jump_buffer_timer -= delta

	# Handle jump.
	if coyote_timer > 0.0 and jump_buffer_timer > 0.0:
		velocity.y = -jump_velocity
		coyote_timer = 0.0
		jump_buffer_timer = 0.0
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
	# Player has fallen.
	if global_position.y > 600.0:
		get_tree().reload_current_scene()
