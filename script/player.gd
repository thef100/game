extends CharacterBody2D
var direction = Vector2.ZERO
var хп = 1
var макс_хп = 20
@export var спид: int
@export var пуля: PackedScene
@onready var inv: Inv = preload("res://magic/resources/inv.tres")
var состояние = "движение"
var предыдущие_состояние = "движение"
var dash_frames = 0
var рывок_готов = true
var стамина = 100
var заряжен = true
var эффекты = []
@export var MainInv: MI

func _ready() -> void:
	$CanvasLayer/Control/ProgressBar.max_value = макс_хп

func _process(delta: float) -> void:
	print(эффекты)
	$CanvasLayer/Control/ProgressBar.value = хп
	стамина += 1
	if состояние == "движение":
		move()
	if состояние == "рывок":
		спид *= 7
	$StaticBody2D.look_at(get_viewport().get_camera_2d().get_global_mouse_position())
	velocity = direction * спид
	if состояние == "рывок":
		спид /= 7
	if Input.is_action_just_pressed("ui_accept") and рывок_готов and стамина > 19:
		стамина -= 20
		dash()
	if Input.is_action_just_released("shoot") and заряжен:
		заряжен = false
		$Timer.start()
		выстрел()
	
	
	#слоты
	
	
	if Input.is_action_just_released("1_слот"):
		first_slot()

	
	if Input.is_action_just_released("2_слот"):
		second_slot()
	
	if Input.is_action_just_released("3_слот"):
		third_slot()
	
	if Input.is_action_just_released("4_слот"):
		fourth_slot()
	
	#хпшки
	
	if хп > макс_хп:
		хп = макс_хп
	
	if хп < 1:
		get_tree().quit()
	move_and_slide()
	
func выстрел():
	var scene = пуля.instantiate()
	add_child(scene)

func move():
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction.x = Input.get_axis("ui_left", "ui_right")

func dash():
	рывок_готов = false
	$"Рывок".start()
	предыдущие_состояние = состояние
	состояние = "рывок"
	$Area2D/CollisionShape2D.disabled = true
	await get_tree().create_timer(0.15).timeout
	$Area2D/CollisionShape2D.disabled = false
	состояние = предыдущие_состояние

func _on_area_2d_body_entered(body: Node2D) -> void:
	self.modulate = Color.RED
	хп -= 1
	await get_tree().create_timer(1.0).timeout
	self.modulate = Color(1, 1, 1)

#слоты

func first_slot():
	if inv.Items[0] != null:
		var мэджик_один = inv.Items[0].scene.instantiate()
		мэджик_один.призванн = $"."
		if стамина > мэджик_один.стамина:
			стамина -= мэджик_один.стамина
			owner.add_child(мэджик_один)
func second_slot():
	if inv.Items[1] != null:
		var мэджик_один = inv.Items[1].scene.instantiate()
		мэджик_один.призванн = $"."
		if стамина > мэджик_один.стамина:
			стамина -= мэджик_один.стамина
			owner.add_child(мэджик_один)
func third_slot():
	if inv.Items[2] != null:
		var мэджик_один = inv.Items[2].scene.instantiate()
		мэджик_один.призванн = $"."
		if стамина > мэджик_один.стамина:
			стамина -= мэджик_один.стамина
			owner.add_child(мэджик_один)
func fourth_slot():
	if inv.Items[3] != null:
		var мэджик_один = inv.Items[3].scene.instantiate()
		мэджик_один.призванн = $"."
		if стамина > мэджик_один.стамина:
			стамина -= мэджик_один.стамина
			owner.add_child(мэджик_один)

func _рывок_готов() -> void:
	рывок_готов = true

func add_effect(эффект: String, время):
	var effect_resource = load(эффект)
	var action_script_class = effect_resource.get("действие")
	var action_instance = action_script_class.new()
	action_instance.add_effect($".")
	эффекты.append(effect_resource.название)
	await get_tree().create_timer(время).timeout
	эффекты.erase(effect_resource.название)
	action_instance.remove_effect($".")

func _on_timer_timeout() -> void:
	заряжен = true
