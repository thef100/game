extends Panel
@onready var ItemVis: Sprite2D = $ItemTexture
func update(item: MII):
	if !item:
		ItemVis.visible = false 
	else:
		ItemVis.visible = true
		ItemVis.texture = item.texture
	pass
