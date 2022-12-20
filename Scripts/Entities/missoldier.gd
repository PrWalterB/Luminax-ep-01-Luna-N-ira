extends KinematicBody2D
var dam = 0
var lifsol = 10*PlVar.diffpro
var mort = false
var nbsig = 0
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$SoundHit.set_volume_db(PlVar.son + 10)
	if dam == 0:
		get_parent().set_animation("default")
	if dam == 1:
		get_parent().set_animation("dam")
	if lifsol <= 0:
		if mort == false:
			mort = true
			$Death.start(0.001)
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and dam == 0:
		lifsol -= damage
		PlVar.bosslife -= damage
		$Hit.start(0.1)
		dam = 1
		var shit = rand_range(0, 1)
		if shit < 0.5:
			$SoundHit.stream = load("res://Sons/HitSol2.wav")
		if shit >= 0.5:
			$SoundHit.stream = load("res://Sons/HitSol3.wav")
		$SoundHit.play()
	pass

func _on_Hit_timeout():
	dam = 0
	pass # Replace with function body.


func _on_Death_timeout():
	if mort == true:
		if nbsig > 0:
			var c = sigma.instance()
			c.global_position = $Position2D2.global_position
			get_parent().get_parent().get_parent().get_parent().get_parent().add_child(c)
			nbsig -= 1
			$Death.start(0.1)
		else:
			var b = particule.instance()
			b.position = $Position2D2.position
			b.start(156, 1)
			get_parent().get_parent().get_parent().get_parent().get_parent().add_child(b)
			get_parent().get_parent().get_parent().get_parent().queue_free()
	pass # Replace with function body.
