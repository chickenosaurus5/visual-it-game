extends AnimatedSprite2D

@onready var game: Node2D = get_node('/root/game')
@onready var sun_scene = preload("res://scenes/sun.tscn")

var of: Vector2 = Vector2.ZERO
var dragging = false
var prevPos: Vector2
var clickCounter: int = 0



func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - of
		if Input.is_action_just_pressed('tester'):
			var sun = sun_scene.instantiate()
			sun.global_position = get_viewport().get_camera_2d().get_global_mouse_position()
			game.add_child(sun)
			


	

func _on_button_pressed() -> void:
	clickCounter+= 1
	if clickCounter == 1:
		prevPos = position
		dragging = true
		of = get_global_mouse_position() - global_position
	elif clickCounter == 2:
		dragging = false
		position = prevPos
		clickCounter = 0
