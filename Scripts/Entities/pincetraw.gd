extends KinematicBody2D
var dam = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# warning-ignore:unused_argument
func _process(delta):
	if dam == 0:
		get_parent().get_node("eye").set_animation("default")
	if dam == 1:
		get_parent().get_node("eye").set_animation("hit")
	pass
func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		PlVar.bosslife -= damage
		$Hit.start(0.1)
		dam = 1
	pass


func _on_Hit_timeout():
	dam = 0
	pass # Replace with function body.
