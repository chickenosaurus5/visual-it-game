extends Camera2D

@export var zoomSpeed: float = 10; 

var zoomTarget: Vector2

var dragStartMousePos = Vector2.ZERO
var dragStartCameraPos = Vector2.ZERO

var isDragging: bool = false

var last_ticks = Time.get_ticks_usec()
var real_delta: float

   
	# Use `real_delta` instead of `delta`

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoomTarget = zoom


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Zoom(delta)
	var now = Time.get_ticks_usec()
	real_delta = (now - last_ticks) / 1000000.0
	last_ticks = now
	
	
func Zoom(delta):
	if Input.is_action_just_pressed('zoom_in'):
		zoomTarget *= 1.1
	if Input.is_action_just_pressed('zoom_out'):
		zoomTarget *= 0.9
	zoom = zoom.slerp(zoomTarget, zoomSpeed*real_delta)
