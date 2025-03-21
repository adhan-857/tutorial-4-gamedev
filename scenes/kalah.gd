extends Area2D

@export var sceneName: String = "Level1"
@export var sceneDeath: String = "LoseScreen"
@export var sceneOver: String = "GameOver"

func _on_body_entered(body: Node2D):
	var current_scene = get_tree().current_scene.name
	if body.name == "Player":
		if current_scene == sceneName:
			Global.lives -= 1
		if Global.lives == 0:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneOver + ".tscn")
			Global.lives = 3
		else:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneDeath + ".tscn")
