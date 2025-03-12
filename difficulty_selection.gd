extends Control

var selected_difficulty = ""  

func _on_easy_pressed() -> void:
	selected_difficulty = "Easy"
	start_host()

func _on_average_pressed() -> void:
	selected_difficulty = "Average"
	start_host()


func _on_hard_pressed() -> void:
	selected_difficulty = "Hard"
	start_host()


func start_host():
	if selected_difficulty == "":
		print("⚠️ Error: No difficulty selected before starting host!")
		return
		
	print("🎮 Starting host with difficulty:", selected_difficulty)
	
	if NetworkManager.host_game():
		NetworkManager.set_difficulty(selected_difficulty)
		get_tree().change_scene_to_file("res://LOBBY.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://PLAY.tscn")
