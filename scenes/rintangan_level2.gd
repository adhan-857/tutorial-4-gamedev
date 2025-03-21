extends RigidBody2D

@export var sceneName: String = "Level2"
@export var sceneDeath: String = "LoseScreen2"
@export var sceneOver: String = "GameOver"

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)

func _integrate_forces(state):
	for i in range(state.get_contact_count()):
		var body = state.get_contact_collider_object(i)
		if body and body.name == "Player":
			var current_scene = get_tree().current_scene.name
			if current_scene == sceneName:
				Global.lives -= 1
			if Global.lives == 0:
				get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneOver + ".tscn")
				Global.lives = 3
			else:
				get_tree().call_deferred("change_scene_to_file", "res://scenes/" + sceneDeath + ".tscn")
