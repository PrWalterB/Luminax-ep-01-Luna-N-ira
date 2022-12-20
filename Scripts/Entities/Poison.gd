extends KinematicBody2D
var taille
var speed = 0.3
var vel = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = rand_range( 0.1, 0.4)
	print(global_position, PlVar.player_pos)
	taille = rand_range(0.2, 1.000)
	self.scale = Vector2(taille, taille)
	self.modulate = Color(rand_range(0.000000, 1.000000), 1, rand_range(0.000000, 1.000000), rand_range(0.600000, 1.000000))
	var rotation_dir = randi()
	rotation += rotation_dir * speed
	vel = Vector2(speed, 0).rotated(rotation)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# warning-ignore:unused_argument
func _physics_process(delta):
# warning-ignore:unused_variable
	var collision_info = move_and_collide(vel)
	pass

func _on_Area2D_body_entered(body):
	if body.name == "player":
		 body.hit(rand_range(1.0, 2.0))
	pass # Replace with function body.
