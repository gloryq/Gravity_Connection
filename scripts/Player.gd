extends KinematicBody2D

var velocity = Vector2()
var gravity = 400
const SPEED = 300
var win = false
const SECOND = 30
var timer = -1

func _process(delta):
	# platform collisions
	if get_slide_count() > 0:
		if (get_slide_collision(0).collider.is_in_group("platform")):
			# change frame to light up platform
			get_slide_collision(0).collider.get_child(0).set_frame(1)
			
			# player can only reverse gravity while on a platform
			if Input.is_action_just_pressed("ui_space"):
				gravity *= -1
				
		if (get_slide_collision(0).collider.is_in_group("end") and not win):
			get_slide_collision(0).collider.get_child(0).set_frame(1)
			win = true
			timer = SECOND
			
	velocity.x = SPEED	
	$"AnimatedSprite".play("default")
	
	if gravity < 0:	
		$"AnimatedSprite".flip_v = true
	else:
		$"AnimatedSprite".flip_v = false
		
	velocity.y = gravity
	
	velocity = move_and_slide(velocity)
	
	if position.y < -200 or position.y > 1100:
		get_tree().change_scene("res://scenes/lose.tscn")
		
	
	if timer > 0:
		timer -= 1
	if timer == 0:
		get_tree().change_scene("res://scenes/win.tscn")
