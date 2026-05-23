extends CharacterBody2D

@export var max_health := 3
var health := max_health

func take_damage(amount: int, source_position: Vector2) -> void:
	health -= amount
	
	if health <= 0:
		die()
func die() -> void:
	queue_free()
