extends Node2D

@export var sceneName: String = "Level2"

func _ready():
	await get_tree().create_timer(2).timeout  # Tunggu 3 detik
	get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
