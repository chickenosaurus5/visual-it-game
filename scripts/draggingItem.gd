extends Sprite2D
@onready var game: Node2D = get_node('/root/game')
@onready var asteroid_scene = preload("res://scenes/asteroid.tscn")

var of: Vector2 = Vector2.ZERO
var dragging = false
var prevPos: Vector2
var clickCounter: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - of
		if Input.is_action_pressed('tester'):
			pass
			var asteroid = asteroid_scene.instantiate()
			asteroid.global_position = get_viewport().get_camera_2d().get_global_mouse_position()
			game.add_child(asteroid)
			



	


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
