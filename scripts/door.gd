extends Area2D

@export var target_scene: String = "res://levels/level1.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("door touched by: ", body.name)
	get_tree().change_scene_to_file(target_scene)
