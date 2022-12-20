extends Node2D
var moment = 0
# warning-ignore:unused_class_variable
var conti = load("res://Scenes/Projectiles/Characters/projveg4.tscn")
# warning-ignore:unused_class_variable
var begin = preload("res://Sons/boue.wav")
var end = preload("res://Sons/bouenope.wav")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Son.set_volume_db(PlVar.son+15)
	$Son.play()
	get_node("debut").set_disabled(false)
	get_node("final").set_disabled(true)
	$particlespr.play("send")
	$Timer.start(0.7)
	pass # Replace with function body.



func _on_Timer_timeout():
	if moment == 2:
		queue_free()
	if moment == 1:
		$particlespr.play("explo")
		moment = 2
		$Timer.start(0.7)
	if moment == 0:
		get_node("debut").set_disabled(true)
		get_node("final").set_disabled(false)
		$particlespr.play("default")
		moment = 1
		$Timer.start(Stats.progferstat[3][0][0])
		
	pass # Replace with function body.




func _on_projprog4_body_entered(body):
	if body.name == "walls":
		$Son.set_volume_db(PlVar.son+15)
		$Son.stream = end
		$Son.play()
		$particlespr.play("explo")
		moment = 2
		$Timer.start(0.7)
	pass # Replace with function body.
