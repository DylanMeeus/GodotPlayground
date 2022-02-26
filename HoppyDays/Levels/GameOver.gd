extends Control


func _ready():
	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
