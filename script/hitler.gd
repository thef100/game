extends CharacterBody2D
var смерть = true
var хп = 200
var бессмертие = false
@export var еврей: Node2D
var state = "пиздюли"
@export var свастон: PackedScene 
var random = RandomNumberGenerator.new()

func _ready() -> void:
	$ProgressBar.max_value = хп
	print("Слава Гитлеру!!!!!!!")
	$"рывок".wait_time = randi() % (10 - 1 + 1) + 1
	$"свастон".wait_time = randi() % (5 - 1 + 1) + 1
	print($"рывок".wait_time)
	$dash.visible = false

func _process(delta: float) -> void:
	print(хп)
	$ProgressBar.value = хп
	if state == "пиздюли":
		$dash.look_at(еврей.position)
		position += $dash.transform.x * 100 * delta
	if state == "прерывок":
		position += $dash.transform.x * 100 * delta
	if state == "рывок":
		position += $dash.transform.x * 1500 * delta
	if хп < 1:
		freeze_game_for_seconds(1488)



func _ай_блять(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("попал")
	self.modulate = Color.RED
	if бессмертие != true:
		$Timer.start()
		хп -= body.damage
		бессмертие = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	смерть = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	смерть = false



func _on_timer_timeout() -> void:
	бессмертие = false
	self.modulate = Color(1, 1, 1)  # или Color.WHITE

func freeze_game_for_seconds(duration: float = 3.0) -> void:
	var original_time_scale = Engine.time_scale
	Engine.time_scale = 0.0  # Останавливаем физику и анимации
	get_tree().paused = true  # Останавливаем обработку узлов
	
	await get_tree().create_timer(duration, true, false, true).timeout
	
	Engine.time_scale = original_time_scale  # Восстанавливаем скорость
	get_tree().paused = false  # Возобновляем игру


func _рывок() -> void:
	var pre_time = random.randf_range(0.2, 1.0)
	$dash.visible = true
	state = "прерывок"
	await get_tree().create_timer(pre_time).timeout
	state = "рывок"
	$dash.visible = false
	await get_tree().create_timer(0.7).timeout
	state = "пиздюли"
	$"рывок".wait_time = randi() % (10 - 1 + 1) + 1


func _свастон() -> void:
	var scene = свастон.instantiate()
	scene.global_position = global_position
	scene.target = еврей
	owner.add_child(scene)
