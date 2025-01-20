extends StaticBody2D

var win_width : int
var p_width: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_width = get_viewport_rect().size.x
	p_width = $ColorRect.get_size().x
	print(win_width, p_width)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += get_parent().PADDLE_SPEED * delta
		
	# Limit paddle movement to window
	position.x = clamp(position.x, (p_width / 2) - 50, win_width - (p_width / 2) - 50)
