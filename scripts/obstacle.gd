extends Area2D

# Only player could activate the tramp.
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().reload_current_scene()
