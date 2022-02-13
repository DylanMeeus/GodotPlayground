extends Control

var player_words = []
var story = "Once upon a time %s watched %s and thought it was the %s movie of the past two decades"
var prompts = ["a name", "an adverb", "ad adjective"]
	
# onready calls this part of the global after _ready() ran (and thus, the node tree is constructed)
onready var PlayerText = get_node("VBoxContainer/HBoxContainer/PlayerText")
onready var DisplayText = get_node("VBoxContainer/DisplayText")

func _ready():
	prompt_player()
	DisplayText.text = "We're playing LooneyLips yall!\n" + DisplayText.text

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	add_to_player_words()

	
func  add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	if len(player_words) == len(prompts):
		return true
	return false

func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = story % player_words
	
	
func prompt_player():
	DisplayText.text = "May I have " + prompts[player_words.size()] + " please?"
