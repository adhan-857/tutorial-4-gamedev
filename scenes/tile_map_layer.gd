extends Node2D

@export var move_distance: float = 50
@export var move_speed: float = 1

var direction: int = 1
var start_position: Vector2

func _ready():
	start_position = position
	move()

func move():
	var tween = get_tree().create_tween()
	var target_position = start_position + Vector2(move_distance * direction, 0)
	tween.tween_property(self, "position", target_position, move_speed).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	direction *= -1  # Ganti arah
	move()  # Ulangi gerakan
