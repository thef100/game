extends RigidBody2D
var damage = 20
var стамина = 20
var призванн: Node2D


func _ready() -> void:
	global_position = get_viewport().get_camera_2d().get_global_mouse_position()
	$AnimatedSprite2D.play("default")

func _process(delta: float) -> void:
	if $AnimatedSprite2D.frame == 5:
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true
	if $AnimatedSprite2D.frame == 7:
		queue_free()
