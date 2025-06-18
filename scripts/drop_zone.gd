extends Node2D

#func _draw() -> void:
	#draw_circle(Vector2.ZERO,100,Color.BLANCHED_ALMOND)
	
func select():
	for child in get_tree().get_nodes_in_group('zone'):
		child.deselect()
		
	modulate = Color.WEB_MAROON
func deselect():
	modulate = Color.WHITE


func _on_h_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
