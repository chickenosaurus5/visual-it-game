extends RigidBody2D

@onready var rocketSpeedLabel: Label = get_node('/root/game/CanvasLayer/rocketSpeed')
# Called when the node enters the scene tree for the first time.
var thrust: Vector2
func _ready() -> void:
	$rocketCamera.make_current()
	pass


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		thrust = Vector2.UP.rotated(rotation) * 100000.0 * delta
		apply_force(thrust)
		
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		angular_velocity = 1.0
		
	elif direction < 0:
		angular_velocity = -1.0
		
	else:
		angular_velocity = 0
	rocketSpeedLabel.text = str(linear_velocity.length())
