extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const DEATH_Y = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position.y > DEATH_Y:
		get_tree().change_scene("res://Levels/GameOver.tscn")
		
