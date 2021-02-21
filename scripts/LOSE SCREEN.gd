extends Sprite

func _process(delta):
	if Input.is_action_pressed("ui_space"):
		get_tree().change_scene("res://scenes/level1.tscn")
