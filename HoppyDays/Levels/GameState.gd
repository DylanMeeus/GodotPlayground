extends Node2D

var lives = 5
var coins = 0
var coins_for_life = 10 # after N coins, get an extra life

func _ready():
	add_to_group("Gamestate")
	get_tree().call_group("GUI", "update_lives", lives)

func hurt():
	$Player.hurt()
	alter_lives(-1)
	# if lives < 0 -> end game
	if lives <= 0:
		end_game()
		
		
func coin_up():
	coins += 1
	get_tree().call_group("GUI", "update_coins", coins)
	if coins % coins_for_life == 0:
		alter_lives(+1)

		
func alter_lives(diff):
	lives = lives + diff
	get_tree().call_group("GUI", "update_lives", lives)

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

	
