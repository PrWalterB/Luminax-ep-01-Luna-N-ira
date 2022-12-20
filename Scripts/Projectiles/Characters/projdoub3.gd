extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Son.set_volume_db(PlVar.son+10)
	$Son.play()
	$particlespr.play("default")
	$Timer.start(0.7)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.




func _on_projdoub3_body_entered(body):
	if body.name == "walls":
		queue_free()
	if "soldier" in body.name:
		 body.hit(rand_range(Stats.doubstat[2][0][0], Stats.doubstat[2][0][1]))
	pass # Replace with function body.
