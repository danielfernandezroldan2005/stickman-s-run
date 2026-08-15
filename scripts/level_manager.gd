extends Node

@export var platform_template: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_platform = platform_template.instantiate()
	new_platform.position = Vector2(0, 100)
	add_child(new_platform)
