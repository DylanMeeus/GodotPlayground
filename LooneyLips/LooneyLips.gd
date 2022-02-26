extends Control


var player_words = []
# 
var story_prompts = {
	"Once upon a time %s watched %s and thought it was the %s movie of the past two decades": ["a name", "an adverb", "an adjective"],
	"When %s went to see %s, she was shoked because of her %s": ["a name", "another name", "a noun"],
}

var chosen_story = ""
	
# onready calls this part of the global after _ready() ran (and thus, the node tree is constructed)
onready var PlayerText = get_node("VBoxContainer/HBoxContainer/PlayerText")
onready var DisplayText = get_node("VBoxContainer/DisplayText")

func _ready():
	randomize() # seed for random
	# get_from_json("stories.json")
	var keys = story_prompts.keys()
	chosen_story = keys[randi() % len(keys)]
	prompt_player()
	DisplayText.text = "We're playing LooneyLips y'all!\n" + DisplayText.text

func _on_PlayerText_text_entered(new_text):	
	add_to_player_words()

func _on_TextureButton_pressed():
	if is_story_done():
		# reload scene
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

	
func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func  add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	if len(player_words) == len(story_prompts[chosen_story]):
		return true
	return false

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = chosen_story % player_words
	
func prompt_player():
	var prompts = story_prompts[chosen_story]
	DisplayText.text = "May I have " + prompts[player_words.size()] + " please?"

func end_game():
	PlayerText.queue_free()
	get_node("VBoxContainer/HBoxContainer/ButtonLabel").text = "Play Again"
	tell_story()
























