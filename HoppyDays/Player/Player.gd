extends KinematicBody2D

const SPEED = 700
const GRAVITY = 100
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000
const WORLD_LIMIT = 3000

var motion = Vector2(0,0)
var lives = 3

signal animate

# multiply by delta keeps values constant even though FPS differs
func _physics_process(delta):
	apply_gravity()
	process_jump()
	process_move()
	animate()
	move_and_slide(motion, UP)
	
	
func process_jump():
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			motion.y -= JUMP_SPEED
			$JumpSFX.play()

func process_move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		return
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = +SPEED
	else:
		motion.x = 0

func apply_gravity():
	if position.y >= WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func animate():
	emit_signal("animate", motion)	

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

func hurt():
	$PainSFX.play()
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	lives -= 1
	if lives == 0:
		end_game()
	else:
		pass
		
		
		
		
		
		
