extends Area2D

@export var data: StarData
@onready var game_manager: Node = %GameManager


func _ready():
	if Global.collected_stars[data.level_id][data.star_id]:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	collect_star()

func collect_star():
	Global.collected_stars[data.level_id][data.star_id] = true
	%GameManager.update_ui()
	queue_free()
