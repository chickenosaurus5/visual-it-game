extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var time_multiplier: Label = $"../../timeMultiplierCont/MarginContainer/timeMultiplier"

func _on_value_changed(value: float) -> void:
	time_multiplier.text = str(value)
	Engine.time_scale = value
