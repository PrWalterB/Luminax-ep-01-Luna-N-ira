extends Node2D
var moment = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Son.set_volume_db(PlVar.son+10)
	$particlespr.play("default")
	get_node("CollisionShape2D").set_disabled(true)
	get_node("CollisionShape2D2").set_disabled(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if moment == 1:
		queue_free()
	pass # Replace with function body.




func _on_projdoub3_body_entered(body):
	if "soldier" in body.name:
		if moment == 0:
			$Son.play()
			$particlespr.play("explode")
			$particlespr.scale = Vector2(2,2)
			get_node("CollisionShape2D").set_disabled(false)
			get_node("CollisionShape2D2").set_disabled(false)
			moment = 1
			$Timer.start(0.25)
		if moment == 1:
			body.hit(rand_range(Stats.togstat[3][0][0], Stats.togstat[3][0][1]))
	pass # Replace with function body.


func _on_projtog4_area_entered(area):
	if area.name == "projtog3":
		if moment == 0:
			$particlespr.play("explode")
			get_node("CollisionShape2D").set_disabled(false)
			get_node("CollisionShape2D2").set_disabled(false)
			moment = 1
	pass # Replace with function body.
