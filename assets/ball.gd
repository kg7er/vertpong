extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2
var random_dir : Vector2

func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
	# Randomize start position and direction of ball.
	position.y = win_size.y / 2
	position.x = randi_range(200, win_size.x -200)
	speed = START_SPEED
	random_dir.y = [1, -1].pick_random()
	random_dir.x = randf_range(-1, 1)
	dir = random_dir.normalized()
	
func _physics_process(delta: float) -> void:
	move_and_collide(dir * speed * delta)
