extends Node2D

var lives = 5

func _ready():
	add_to_group("Gamestate")
	get_tree().call_group("GUI", "update_lives", lives)

func hurt():
	lives -= 1
	$Player.hurt()
	get_tree().call_group("GUI", "update_lives", lives)
	# if lives < 0 -> end game
	if lives <= 0:
		end_game()

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

	
