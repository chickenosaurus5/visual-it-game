extends Node2D
var particle
var img
var particles: Array[Array] = []
@onready var circle_shape = CircleShape2D.new()
@export var tex : Texture2D 
@onready var marker_2d: Marker2D = $Marker2D


func create_particle(pos: Vector2):
	var ps := PhysicsServer2D
	particle = ps.body_create()
	ps.body_set_space(particle,get_world_2d().space)
	ps.body_add_shape(particle,circle_shape)
	ps.body_set_param(particle,ps.BODY_PARAM_FRICTION, 0.1)
	ps.body_set_param(particle, ps.BODY_PARAM_MASS, 0.1)
	var trans = Transform2D(0,pos)
	ps.body_set_state(particle,PhysicsServer2D.BODY_STATE_TRANSFORM,trans)
	
	var rs = RenderingServer
	img = rs.canvas_item_create()
	rs.canvas_item_set_parent(img,get_canvas_item())
	rs.canvas_item_add_texture_rect(img,Rect2(-24,-24,48,48),tex.get_rid())
	rs.canvas_item_set_transform(img,trans)
	particles.append([particle,img])
	


func _ready() -> void:
	circle_shape.radius = 24
	circle_shape.custom_solver_bias = 0.1 



	
func _physics_process(delta: float) -> void:
	#var index: int = 0
	for particleArr in particles:
		var singleParticle: RID = particleArr[0]
		var singleParticleTex: RID = particleArr[1]
		var trans = PhysicsServer2D.body_get_state(singleParticle,PhysicsServer2D.BODY_STATE_TRANSFORM)
		RenderingServer.canvas_item_set_transform(singleParticleTex,trans)	
		#if trans.origin.y > 1080:
			#particles.remove_at(index)
			#PhysicsServer2D.free_rid(singleParticle)
			#RenderingServer.free_rid(singleParticleTex)
			#print('object deleted')
		#index += 1
	
func _exit_tree() -> void:
	for particleArr in particles:
		var singleParticle: RID = particleArr[0]
		var singleParticleTex: RID = particleArr[1]
		PhysicsServer2D.free_rid(singleParticle)
		RenderingServer.free_rid(singleParticleTex)
		print('object deleted')
	
func _process(delta: float) -> void:
	
	#if Input.is_action_pressed('summon_whater'):
		#create_particle(marker_2d.global_position + Vector2(randf()-0.5, randf()-0.5).normalized()*10.0*randf())
		pass
	
func bla():
	print('bla')	
	


	
