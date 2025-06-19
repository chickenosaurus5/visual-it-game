extends PanelContainer


@onready var globalCamera = get_node('/root/game/Camera2D')



func _on_button_pressed() -> void:
	globalCamera.make_current()
