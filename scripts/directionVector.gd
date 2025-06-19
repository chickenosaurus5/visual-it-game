extends Line2D

@onready var rocket: RigidBody2D = get_node('/root/game/rocket/RigidBody2D')
@onready var velocityCheck:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/MarginContainer4/velocityCont/velocityCheckbox')
@onready var trajectoryCheck:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/MarginContainer5/trajectoryCont/trajectoryCheck')
#@onready var rotation_degree := rocket.rotation
@onready var planet := get_node("/root/game/planet")
const SIMULATION_TIME := 50.0   
const STEP := 0.1                 
var state: Vector2
func _ready() -> void:
	pass 
func _physics_process(delta: float) -> void:
	state = rocket.get_gravity()

	
func draw_trajectory():
	if trajectoryCheck.button_pressed:
		clear_points()

		var pos := rocket.global_position
		var velocity := rocket.linear_velocity
		var space_state = get_world_2d().direct_space_state

		var time := 0.0
		while time < SIMULATION_TIME:
			
			
			velocity += state * STEP
			pos += velocity * STEP
			time += STEP
			add_point(to_local(pos))
	else:
		clear_points()

func _draw() -> void:
	if velocityCheck.button_pressed:
		var start_point := Vector2.ZERO
		var end_point := rocket.to_local(rocket.global_position + rocket.linear_velocity)
		draw_line(start_point,end_point,Color.BROWN,2)
	
func _process(delta: float) -> void:
		queue_redraw()
		draw_trajectory()
	
	

	
	
