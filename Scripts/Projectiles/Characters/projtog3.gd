extends Node2D
var moment = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Son.set_volume_db(PlVar.son+10)
	$particlespr.play("default")
	$Timer.start(4)
	get_node("CollisionShape2D").set_disabled(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if moment == 2:
		queue_free()
	if moment == 1:
		$Son.play()
		$particlespr.play("explode")
		$Timer.start(0.733)
		get_node("CollisionShape2D").set_disabled(false)
		$particlespr.z_index = 2
		moment = 2
	if moment == 0:
		$particlespr.play("soon")
		$Timer.start(1)
		moment = 1
	pass # Replace with function body.




func _on_projdoub3_body_entered(body):
	if "soldier" in body.name:
		 body.hit(rand_range(Stats.togstat[2][0][0], Stats.togstat[2][0][1]))
	pass # Replace with function body.


func _on_projtog3_area_entered(area):
	if area.name == "projtog3":
		$particlespr.play("explode")
		$Timer.start(0.733)
		get_node("CollisionShape2D").set_disabled(false)
		moment = 2
	pass # Replace with function body.
