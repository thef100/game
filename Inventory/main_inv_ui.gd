extends Control

var IsOpen = false 
@onready var MInv = preload("res://Inventory/MainPlayerInv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
func _ready() -> void:
	upd_slots()
	close()
func upd_slots():
	for i in range(min(MInv.MItems.size(), slots.size())):
		slots[i].update(MInv.MItems[i])
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MainInvCtrl"):
		print("e")
		if IsOpen == true:
			close()
		else:
			open()
func open():
	visible = true
	IsOpen = true
	
func close():
	visible = false
	IsOpen = false
