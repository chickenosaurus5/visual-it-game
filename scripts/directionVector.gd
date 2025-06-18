extends Line2D

@onready var rocket: RigidBody2D = get_node('/root/game/rocket/RigidBody2D')
#@onready var rotation_degree := rocket.rotation
@onready var planet := get_node("/root/game/planet")
const SIMULATION_TIME := 50.0    # seconds to simulate
const STEP := 0.1                 # simulation timestep
const GRAVITY := Vector2(0, 200)   # match your project gravity (pixels/s²)
var state: Vector2
func _ready() -> void:
	pass 
func _physics_process(delta: float) -> void:
	state = rocket.get_gravity()

	
func draw_trajectory():
	clear_points()
	var points_array: Array[Vector2] = []

	var pos := rocket.global_position
	var velocity := rocket.linear_velocity
	var space_state = get_world_2d().direct_space_state
	# simulate trajectory
	var time := 0.0
	while time < SIMULATION_TIME:
		
		
		# basic physics update: x = x + v*dt, v = v + g*dt
		
		velocity += state * STEP
		pos += velocity * STEP
		time += STEP
		add_point(to_local(pos))

func _draw() -> void:
	var start_point := Vector2.ZERO
	var end_point := rocket.to_local(rocket.global_position + rocket.linear_velocity)
	draw_line(start_point,end_point,Color.BROWN,2)
	
func _process(delta: float) -> void:
	queue_redraw()
	draw_trajectory()
