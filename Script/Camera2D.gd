#extends Camera2D
#
#var dragging = false
#var drag_start = Vector2.ZERO
#
#func _input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#if event.pressed:
				#dragging = true
				#drag_start = get_global_mouse_position()
			#else:
				#dragging = false
#
#func _process(delta):
	#if dragging:
		#var drag_end = get_global_mouse_position()
		#var drag_delta = drag_end - drag_start
		#drag_delta *= -1  # invert for intuitive dragging
		#drag_delta /= get_zoom()  # adjust for zoom level
		#offset_camera(drag_delta)
#
#func offset_camera(offset):
	#global_position += offset
extends Camera2D

var dragging = false
var drag_start = Vector2.ZERO
var zoom_speed = 0.1
var min_zoom = 0.5
var max_zoom = 2.0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_start = get_global_mouse_position()
			else:
				dragging = false

	# Zoom with mouse wheel
	elif event is InputEventMouseMotion:
		if event.is_action_pressed("zoom_in"):
			zoom_camera(1)
		elif event.is_action_pressed("zoom_out"):
			zoom_camera(-1)

func _process(delta):
	if dragging:
		var drag_end = get_global_mouse_position()
		var drag_delta = drag_end - drag_start
		drag_delta *= -1  # invert for intuitive dragging
		drag_delta /= get_zoom()  # adjust for zoom level
		offset_camera(drag_delta)

func offset_camera(offset):
	global_position += offset

func zoom_camera(direction):
	var new_zoom = get_zoom() + direction * zoom_speed
	new_zoom = clamp(new_zoom, min_zoom, max_zoom)
	set_zoom(new_zoom)

