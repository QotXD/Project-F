extends CharacterBody2D

@export var max_health := 3.0
var health := max_health

const MAX_SPEED = 350.0
const ACCELERATION = 2000.0
const DECELERATION = 2500.0
const AIR_CONTROL_MULT = 0.6

const JUMP_VELOCITY = -500.0
const FALL_GRAVITY_MULT = 1.2
const LOW_JUMP_GRAVITY_MULT = 3.2

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_jump()
	handle_horizontal_movement(delta)
	update_animation()
	move_and_slide()

#DEATH


func take_damage(amount: float, source_position: Vector2) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	Engine.time_scale = 0.5
	%GameOver.show()
	await get_tree().create_timer(2.0, false, false, true).timeout
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

#GRAVITY
func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		if velocity.y < 0 and Input.is_action_pressed("jump"):
			# Rising while holding jump → normal gravity
			velocity += get_gravity() * delta
		elif velocity.y < 0:
			# Rising but released jump → cut jump short
			velocity += get_gravity() * LOW_JUMP_GRAVITY_MULT * delta
		else:
			# Falling → heavier gravity
			velocity += get_gravity() * FALL_GRAVITY_MULT * delta

#JUMP
func handle_jump() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

#MOVEMENT
func handle_horizontal_movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")

	var accel = ACCELERATION if is_on_floor() else ACCELERATION * AIR_CONTROL_MULT
	var decel = DECELERATION

	if direction != 0:
		var target_speed = direction * MAX_SPEED
		velocity.x = move_toward(velocity.x, target_speed, accel * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, decel * delta)

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
		
#ANIMATION
func update_animation() -> void:
	if is_on_floor():
		if abs(velocity.x) < 10:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
