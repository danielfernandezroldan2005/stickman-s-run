extends Node

@export var platform_template: PackedScene
@export var player: CharacterBody2D
@export var score_label: Label

var last_spawn_x: float = 0.0
var current_y: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		spawn_platform()
		
func spawn_platform() -> void:
	var new_platform = platform_template.instantiate()
	new_platform.position = Vector2(last_spawn_x, current_y)
	add_child(new_platform)	
	
	last_spawn_x += randf_range(150.0,250.0)
	current_y += randf_range(-40.0, 40.0)

func _process(delta: float) -> void:
	if player != null and player.global_position.x > last_spawn_x - 500.0:
		spawn_platform()
	if player != null:
		score_label.text = "Distancia: " + str(round(player.global_position.x)) + " m"
	
