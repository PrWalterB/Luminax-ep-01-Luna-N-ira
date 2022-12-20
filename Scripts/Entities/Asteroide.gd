extends KinematicBody2D
var mort = 0
var particule = preload("res://Scenes/Other/particle.tscn")
var type = 0
var vel = Vector2()
var speed = 0
var sprot
var rot = 0
var life = 10*PlVar.diffpro
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	type = rand_range(1, 6)
	type = int(type)
	if type == 1 or type == 2:
		life = 10
	if type == 3 or type == 4:
		life = 5
	if type == 5 or type == 6:
		life = 20
	speed = rand_range(0.2, 2.5)
	rot = randi()
	sprot = rand_range(-0.005, 0.005)
	$AnimatedSprite.play(str(type))
	get_node(str(type)).set_disabled(false)
	get_node("Area"+str(type)+"/coll").set_disabled(false)
	vel.x -= speed
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.map != 3:
		queue_free()
	if mort == 1:
		var b = particule.instance()
		b.global_position = $boulpos.global_position
		if type == 1 or type == 2:
			b.start(12, 1)
		if type == 3 or type == 4:
			b.start(34, 1)
		if type == 5 or type == 6:
			b.start(56, 1)
		get_parent().add_child(b)
		queue_free()
	if PlVar.pause == 0:
		rot += sprot
		rotation += sprot * speed
		# warning-ignore:return_value_discarded
		move_and_collide(vel)
	if life <= 0:
		mort = 1
	pass


func _on_Timer_timeout():
	
	pass # Replace with function body.

func hit(degat):
	if PlVar.pause == 0:
		life -= degat
	pass

func _on_Area1_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(10.5, 15.5))
		mort = 1
	pass # Replace with function body.


func _on_Area2_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(10.5, 15.5))
		mort = 1
	pass # Replace with function body.


func _on_Area3_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(8.5, 10.5))
		mort = 1
	pass # Replace with function body.


func _on_Area4_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(8.5, 10.5))
		mort = 1
	pass # Replace with function body.


func _on_Area5_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(15.5, 20.5))
		mort = 1
	pass # Replace with function body.


func _on_Area6_body_entered(body):
	if body.name == "player":
		body.hit(rand_range(15.5, 20.5))
		mort = 1
	pass # Replace with function body.
