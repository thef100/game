extends Control
@onready var inv = preload("res://magic/resources/inv.tres")
var vis = false

func _ready() -> void:
	close()
	for clen in range(inv.Items.size()):
		var item = inv.Items[clen]
		$ItemList.add_item(item.name, item.texture, true)
		
func _process(delta: float) -> void:
	if Input.is_action_just_released("e"):
		if vis == false:
			open()
		else:
			close()
		pass
	if vis == true and Input.is_action_just_pressed("shoot"):
		
		pass
	
func open():
	self.visible = true
	get_node("ItemList").visible = true
	get_node("Panel").visible = true
	vis = true
	pass
func close():
	self.visible = false
	get_node("ItemList").visible = false
	get_node("Panel").visible = false
	vis = false
	pass
	
