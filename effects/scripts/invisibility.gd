extends effect

func add_effect(объект):
	объект.modulate.a = 0.5

func remove_effect(объект):
	объект.modulate.a = 1
