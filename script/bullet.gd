extends RigidBody2D

func _ready() -> void:
	look_at(get_viewport().get_camera_2d().get_global_mouse_position())
	position = Vector2(0, 0)

func _process(delta):
	global_position += transform.x * 300
