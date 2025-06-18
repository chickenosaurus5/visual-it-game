extends Node2D

var selected = false
var restPoint
var restNodes = []

func _ready() -> void:
	restNodes = get_tree().get_nodes_in_group('zone')
	restPoint = restNodes[0].global_position
	restNodes[0].select()



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed('click'):
		selected = true
func _physics_process(delta: float) -> void:
	if selected:
		
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta) 
		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, restPoint, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10*delta)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortestDist = 75
			for child in restNodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortestDist:
					child.select()
					restPoint = child.global_position
					shortestDist = distance
