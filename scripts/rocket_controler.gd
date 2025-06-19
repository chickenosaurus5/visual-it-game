extends RigidBody2D

@onready var rocketSpeedLabel: Label = get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/MarginContainer6/HBoxContainer4/rocketSpeed')

@onready var thrustSlider:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/HBoxContainer/thrustSlider')
@onready var thrustLabel:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/HBoxContainer/thrustValue')

@onready var weightSlider:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/HBoxContainer2/weightSlider')
@onready var weightLabel:= get_node('/root/game/CanvasLayer/sidebar2/rocketPhysicsCont/VBoxContainer1/VBoxContainer/HBoxContainer2/HBoxContainer/weightValue')
var thrust: Vector2
func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	mass = weightSlider.value
	weightLabel.text = str(weightSlider.value)
	thrustLabel.text = str(thrustSlider.value/1000)
	if Input.is_action_pressed("ui_accept"):
		thrust = Vector2.UP.rotated(rotation) * thrustSlider.value * delta
		apply_force(thrust)
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		angular_velocity = 1.0
		
	elif direction < 0:
		angular_velocity = -1.0
		
	else:
		angular_velocity = 0
	if round(linear_velocity.length()) < 4:
		rocketSpeedLabel.text = '0.0'
	else:
		rocketSpeedLabel.text = str(round(linear_velocity.length()))
	



func _on_camera_switcher_pressed() -> void:
		$rocketCamera.make_current()
