extends Area2D

@onready var rocket = get_node('/root/game/rocket/RigidBody2D')
@onready var rocketSprite = get_node('/root/game/rocket/RigidBody2D/Sprite2D')
@onready var rocketAnimation = get_node('/root/game/rocket/RigidBody2D/AnimatedSprite2D')
@onready var restarter: Timer = $"../restarter"



func _on_body_entered(body: Node2D) -> void:
	if round(rocket.linear_velocity.length()) >= 600:
		rocketSprite.hide()
		rocketAnimation.play('explosion')
		restarter.start()

			
		
	
func _on_restarter_timeout() -> void:
	get_tree().reload_current_scene()
