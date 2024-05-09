extends Node2D

var unit = preload("res://Script/path_2d.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		spawn_unit()
	
func spawn_unit():
	var spawn = unit.instantiate()
	add_child(spawn)
