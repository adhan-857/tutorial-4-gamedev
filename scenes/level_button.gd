extends LinkButton

@export var scene_to_load: String

func _on_Level1_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	
func _on_Level2_pressed():
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	
func _on_Main_Menu_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
