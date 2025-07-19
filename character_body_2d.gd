extends CharacterBody2D

const MOVE_SPEED = 1000
const JUMP_FORCE = 900
const GRAVITY = 1200
var can_move=false
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		if velocity.y > 0:
			velocity.y = 0

	if can_move:
		var direction = 0
		if Input.is_action_pressed("ui_right"):
			direction += 1
		if Input.is_action_pressed("ui_left"):
			direction -= 1

		velocity.x = direction * MOVE_SPEED

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = -JUMP_FORCE

	move_and_slide()
		
	
