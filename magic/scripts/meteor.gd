extends Area2D
var damage = 20
var стамина = 20


func _ready() -> void:
	global_position = get_viewport().get_camera_2d().get_global_mouse_position()
	$AnimatedSprite2D.play("default")

func _process(delta: float) -> void:
	if $AnimatedSprite2D.frame == 5:
		$RigidBody2D/CollisionShape2D.Radius
	else:
		pass
	if $AnimatedSprite2D.frame == 7:
		queue_free()
