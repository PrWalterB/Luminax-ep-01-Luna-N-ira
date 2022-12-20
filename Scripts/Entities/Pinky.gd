extends KinematicBody2D
var vel = Vector2()
var speed = 40
# warning-ignore:unused_class_variable
var target = Vector2()
var actionx = 0
var actiony = 0
var actionbool = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(0.1)
	actionx = rand_range(0, 1)
	actiony = rand_range(0, 1)
	actionbool = rand_range(0, 1)
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$AudioStreamPlayer2D.set_volume_db(PlVar.son + 5)
	if actionx <= 0.5:
		vel.x += speed
	if actionx > 0.5:
		vel.x -= speed
	if actiony <= 0.5:
		vel.y += speed
	if actiony > 0.5:
		vel.y -= speed
	if actionbool <= 0.2:
		speed = 0
	if actionbool > 0.2:
		speed = 40
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	vel.x = 0
	vel.y = 0
	pass


func _on_Timer_timeout():
	$Timer.start(0.1)
	actionx = rand_range(0, 1)
	actiony = rand_range(0, 1)
	actionbool = rand_range(0, 1)
	pass # Replace with function body.


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
