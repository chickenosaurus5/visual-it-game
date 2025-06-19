extends PanelContainer


@onready var rocketStat := get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont')
@onready var planets := get_node('/root/game/CanvasLayer/sidebar2/planets')


@onready var bttn := get_node('/root/game/CanvasLayer/sidebar1/VBoxContainer/objectsTabCont')
var pressControl: bool = false


	
	


func _on_button_pressed() -> void:
		planets.hide()
		rocketStat.show()
		bttn.theme_type_variation = ''
		theme_type_variation = 'selectedIconColor'
		pressControl = true
