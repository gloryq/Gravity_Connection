extends KinematicBody2D

var velocity = Vector2()
var gravity = 300
var speed = 300

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("ui_space"):
		gravity *= -1
	
	if gravity < 0:	
		$"AnimatedSprite".flip_v = true
	else:
		$"AnimatedSprite".flip_v = false
		
	velocity.y = gravity
	
	velocity = move_and_slide(velocity)
