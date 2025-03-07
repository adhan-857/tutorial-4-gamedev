extends RigidBody2D

@export var sceneName: String = "LoseScreen2"

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)

func _integrate_forces(state):
	for i in state.get_contact_count():
		var body = state.get_contact_collider_object(i)
		if body and body.name == "Player":
			get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")
