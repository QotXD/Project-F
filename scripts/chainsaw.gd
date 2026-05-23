extends Sprite2D

@export var orbit_radius: float = 20.0
@onready var player = get_parent() 

#FOLLOW MOUSE ON A AXIS AROUND PLAYER
func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - player.global_position).normalized()
	global_position = player.global_position + (direction * orbit_radius)
	look_at(mouse_pos)


func _on_chainsaw_hitbox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
