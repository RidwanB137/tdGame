extends CharacterBody2D

var previous_position = global_position

func _process(delta):
	if global_position != previous_position:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play_backwards("attack")
	previous_position = global_position
