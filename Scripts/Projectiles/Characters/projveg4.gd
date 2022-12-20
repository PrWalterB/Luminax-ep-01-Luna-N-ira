extends Node2D
var sens = -1
var moment = 0
var conti = load("res://Scenes/Projectiles/Characters/projveg4.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Son.play()
	pass # Replace with function body.

func start(sensa):
	if sensa == -1:
		sens = PlVar.sens
	else:
		sens = sensa
	if sens == 0:
		$particlespr.play("sendD")
	if sens == 1:
		$particlespr.play("sendU")
	if sens == 2:
		$particlespr.play("sendR")
	if sens == 3:
		$particlespr.play("sendL")
	$Timer.start(0.5)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Son.set_volume_db(PlVar.son + 5)
	pass


func _on_Timer_timeout():
	if moment == 2:
		queue_free()
	if moment == 1:
		$Son2.play()
		if sens == 0:
			$particlespr.play("expD")
		if sens == 1:
			$particlespr.play("expU")
		if sens == 2:
			$particlespr.play("expR")
		if sens == 3:
			$particlespr.play("expL")
		moment = 2
		$Timer.start(0.5)
	if moment == 0:
		if sens == 0:
			$particlespr.play("ver")
		if sens == 1:
			$particlespr.play("ver")
		if sens == 2:
			$particlespr.play("hor")
		if sens == 3:
			$particlespr.play("hor")
		var b = conti.instance()
		if sens == 0:
			b.global_position = $D.global_position
		if sens == 1:
			b.global_position = $U.global_position
		if sens == 2:
			b.global_position = $R.global_position
		if sens == 3:
			b.global_position = $L.global_position
		b.start(sens)
		get_parent().add_child(b)
		moment = 1
		$Timer.start(5)
	pass # Replace with function body.


func _on_Particule_body_entered(body):
	if body.name == "walls":
		queue_free()
	if "soldier" in body.name:
		 body.hit(rand_range(Stats.vegetstat[3][0][0], Stats.vegetstat[3][0][1]))
	pass # Replace with function body.
