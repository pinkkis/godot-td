extends Camera2D

@export var max_zoom := 2.0
@export var min_zoom := .5

var drag_cursor_shape = false

func _input(event):
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_RIGHT:
			position -= event.relative / zoom
			position.x = clampf(position.x, 0.0, 320.0)
			position.y = clampf(position.y, 0.0, 200.0)
			drag_cursor_shape = true
		else:
			drag_cursor_shape = false

	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom += Vector2.ONE * 0.1
				if zoom.x > max_zoom:
					zoom = Vector2.ONE * max_zoom
					return
				position += get_local_mouse_position() / 10
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= Vector2.ONE * 0.1
				if zoom.x < min_zoom:
					zoom = Vector2.ONE * min_zoom

func _process(_delta):
	if drag_cursor_shape:
		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_DRAG)
