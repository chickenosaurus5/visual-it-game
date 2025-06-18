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
	simplePan(delta)
	ClickAndDrag()
	var now = Time.get_ticks_usec()
	real_delta = (now - last_ticks) / 1000000.0
	last_ticks = now
	
	
func Zoom(delta):
	if Input.is_action_just_pressed('zoom_in'):
		zoomTarget *= 1.1
	if Input.is_action_just_pressed('zoom_out'):
		zoomTarget *= 0.9
	zoom = zoom.slerp(zoomTarget, zoomSpeed*real_delta)
func simplePan(delta):
	
	var moveAmount: Vector2 = Vector2.ZERO
	if Input.is_action_pressed('pan_up'):
		moveAmount.y -= 1
	if Input.is_action_pressed('pan_down'):
		moveAmount.y += 1
	if Input.is_action_pressed('pan_left'):
		moveAmount.x -= 1
	if Input.is_action_pressed('pan_right'):
		moveAmount.x += 1	
	moveAmount = moveAmount.normalized()
	position += moveAmount * (real_delta) * 1000 * (1/zoom.x)
func ClickAndDrag():
	
	if !isDragging and Input.is_action_just_pressed('camera_drag'):
		dragStartMousePos = get_viewport().get_mouse_position()
		dragStartCameraPos = position
		isDragging = true
	if isDragging and Input.is_action_just_released('camera_drag'):
		isDragging = false
	if isDragging:
		var moveVector = get_viewport().get_mouse_position() - dragStartMousePos
		position = dragStartCameraPos - moveVector * (1/zoom.x)
