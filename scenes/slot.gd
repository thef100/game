extends Panel

@onready var visual_item: Sprite2D = $Sprite2D

func update(item: InvItem):
	if !item:
		visual_item.visible = false
	else:
		visual_item.visible = true
		visual_item.texture = item.texture
