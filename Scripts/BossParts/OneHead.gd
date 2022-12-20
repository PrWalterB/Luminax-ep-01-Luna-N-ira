extends KinematicBody2D
var trans = 0
var state = 0
var trembl = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Hurle.set_volume_db(PlVar.son + 30)
	self.rotation_degrees = 13 + trans
	pass


func screaming(speed):
	state = 1
	$AnimatedSprite.play("scream")
	$Timer.start(speed)
	$Trans.start(0.01)
	$Hurle.play()
	pass

func _on_Timer_timeout():
	state = 0
	$AnimatedSprite.play("default")
	pass # Replace with function body.


func _on_Trans_timeout():
	if state == 0:
		trans += rand_range(-trembl, trembl)*PlVar.uldelta
	if state == 1:
		trans += 10*PlVar.uldelta
	$Trans.start(0.01)
	pass # Replace with function body.
