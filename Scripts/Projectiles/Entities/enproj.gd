extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$SoundHit.set_volume_db(PlVar.son + 5)
	$Timer.start(0.5)
	var shit = rand_range(0, 1)
	if shit < 0.5:
		$SoundHit.stream = load("res://Sons/Sol_lame1.wav")
	if shit >= 0.5:
		$SoundHit.stream = load("res://Sons/Sol_lame2.wav")
	$SoundHit.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "player":
		 body.hit(rand_range(5, 5.5))
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
