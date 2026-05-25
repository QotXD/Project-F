extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Global.coins += 1
	%GameManager.update_ui()
	queue_free()
