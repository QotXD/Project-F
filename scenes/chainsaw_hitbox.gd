extends Area2D

@export var damage_per_second := 5.0

var bodies_in_saw := []

func _process(delta: float) -> void:
	for body in bodies_in_saw:
		if body.has_method("take_damage"):
			body.take_damage(damage_per_second * delta, global_position)

func _on_body_entered(body: Node2D) -> void:
	bodies_in_saw.append(body)

func _on_body_exited(body: Node2D) -> void:
	bodies_in_saw.erase(body)
