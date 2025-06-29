extends PanelContainer

@onready var planets := get_node('/root/game/CanvasLayer/sidebar2/planets')
@onready var rocketStat := get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont')

@onready var bttn := get_node('/root/game/CanvasLayer/sidebar1/VBoxContainer/rocketPhysicsCont')

var pressControl: bool = false

func _on_button_pressed() -> void:
		rocketStat.hide()
		planets.show()
		bttn.theme_type_variation = ''
		theme_type_variation = 'selectedIconColor'
