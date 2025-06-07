extends Control
@onready var inv = preload("res://magic/resources/inv.tres")


func _ready() -> void:
	for clen in range(inv.Items.size()):
		var item = inv.Items[clen]
		$ItemList.add_item(item.name, item.texture, true)
