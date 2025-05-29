extends RigidBody2D

var baff_type = "heal"
var strength = 1
var игрок = false
var объект_хила = null
var стамина = 40
var призванн: Node2D

func _ready():
	global_position = призванн.global_position
	$AnimationPlayer.play("spawn")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(5).timeout
	$AnimationPlayer.play("despawn")
	await $AnimationPlayer.animation_finished
	queue_free()

func _on_healarea_body_entered(body: Node2D) -> void:
	объект_хила = body
	игрок = true

func _on_healarea_body_exited(body: Node2D) -> void:
	var объект_хила = null
	игрок = false

func _on_timer_timeout() -> void:
	$Timer.start()
	if объект_хила != null:
		объект_хила.хп += 1
