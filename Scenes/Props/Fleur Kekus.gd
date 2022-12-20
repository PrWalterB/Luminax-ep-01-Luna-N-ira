extends KinematicBody2D
var vel = Vector2()
var speed = 20
# warning-ignore:unused_class_variable
var target = Vector2()
var gposx
var gposy
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	gposx = global_position.x
	gposy = global_position.y
	$Timer.start(120)
	vel.x += speed
	vel.y += speed
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	vel.x += speed
	vel.y += speed
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	vel.x = 0
	vel.y = 0
	pass


func _on_Timer_timeout():
	global_position.x = gposx
	global_position.y = gposy
	$Timer.start(120)
	pass # Replace with function body.
