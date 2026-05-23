extends CharacterBody2D

@export var max_health := 3.0
var health := max_health

const SPEED = 60
var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func take_damage(amount: float, source_position: Vector2) -> void:
	health -= amount
	
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	# position.x += direction * SPEED * delta
