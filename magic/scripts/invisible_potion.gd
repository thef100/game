extends CPUParticles2D
var призванн: Node2D
var стамина = 100

func _ready() -> void:
	global_position = призванн.global_position
	global_position.y += 1
	призванн.add_effect("res://effects/resources/invisibility.tres", 10)
	emitting = true
func _process(delta: float) -> void:
	if Input.is_action_just_released("e"):
		emitting = false



func _on_finished() -> void:
	queue_free()
