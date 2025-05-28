extends Control

@onready var inv: Inv = preload("res://magic/resources/inv.tres")
@onready var slots: Array = $NinePatchRect/HBoxContainer.get_children()

func _ready() -> void:
	update_slots()
func update_slots():
	for i in range(min(inv.Items.size(), slots.size())):
		slots[i].update(inv.Items[i])
