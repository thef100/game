extends RigidBody2D
var target: Node2D

func _ready() -> void:
	if target != null:
		look_at(target.global_position)

func _process(delta):
	$Sprite2D.rotation += 10
	global_position += transform.x * 70
