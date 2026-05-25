extends Area2D

@export var target_scene: String = "res://scenes/hub.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("hub door touched by: ", body.name)
	get_tree().change_scene_to_file(target_scene)
