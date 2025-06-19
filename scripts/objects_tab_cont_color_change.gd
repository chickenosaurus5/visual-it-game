extends PanelContainer

@onready var planets := get_node('/root/game/CanvasLayer/sidebar2/planets')


var pressControl: bool = false

func _on_button_pressed() -> void:
	if !pressControl:
		planets.show()
		theme_type_variation = 'selectedIconColor'
		pressControl = true
	else:
		planets.hide()
		theme_type_variation = ''
		pressControl = false
	
