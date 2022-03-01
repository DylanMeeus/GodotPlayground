extends KinematicBody2D

const RUN_SPEED = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 400
const GRAVITY = 10

var motion = Vector2(300,0)

func _ready():
	# hacky workaround to some issues with Godot 3.x
	$Camera2D/ParallaxBackground/ParallaxLayer.scale.x = 2
	$Camera2D/ParallaxBackground/ParallaxLayer.scale.y = 2
	$Camera2D/ParallaxBackground/ParallaxLayer.position.y = -400

func _physics_process(delta):
	process_gravity()
	process_keys()
	print(position.y)
	move_and_slide(motion, UP)

func process_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0
		motion.x = RUN_SPEED

func process_keys():
	if Input.is_action_pressed("jump") and is_on_floor():
		jump()


func jump():
	motion.y -= JUMP_SPEED
	motion.x += JUMP_SPEED
