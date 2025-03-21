extends Area2D

@export var sceneName: String = "Level2"
@export var transition_duration: float = 0.5

func _on_body_entered(body: Node2D):
	if body.get_name() == "Player":
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.set_trans(Tween.TRANS_CUBIC)
		
		tween.tween_property(get_tree().current_scene, "modulate", Color(0, 0, 0, 0), transition_duration)
		
		await tween.finished
		
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
