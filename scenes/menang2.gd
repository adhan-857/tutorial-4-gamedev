extends Area2D

@export var sceneName: String = "YouWon"

func _on_body_entered(body: Node2D):
	if body.get_name() == "Player":
		Global.lives = 3
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
