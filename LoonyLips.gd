extends Control


var player_words = []
var story = "Holy snikies! It's %s Hero of %s with the ability to %s hes the %s!"
var prompts = ["a name", "a place", "an action", "an adjective"]
onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	DisplayText.text = " Hello this a Loony lips. Below you can enter text when prompted and they will be used to make a story. "	
	check_player_words_length()
	PlayerText.grab_focus()

func _on_PlayerText_text_entered(new_text):
	
	 add_to_player_words()
	

func _on_PlayerButton_pressed():
	if is_story_complete():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	
	
func add_to_player_words():
 	player_words.append(PlayerText.text)
	 DisplayText.text = ""
	 PlayerText.clear()
	 check_player_words_length()

func is_story_complete():
	return player_words.size() == prompts.size()
	
	
func check_player_words_length():
	if is_story_complete():
		end_game()
	else:
		prompt_player()
		
			
func tell_story():
		DisplayText.text = story % player_words
		
		
		
func prompt_player():
		DisplayText.text += "May I have " + prompts[player_words.size()] + ", please?"


	

func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/PlayerButton/Label.text = "Again!"
	tell_story()
