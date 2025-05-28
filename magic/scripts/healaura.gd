extends RigidBody2D

var baff_type = "heal"
var strength = 1

func _process(delta: float) -> void:
	await get_tree().create_timer(5).timeout
