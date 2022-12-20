extends KinematicBody2D
var lifsol = 20*PlVar.diffpro
var mode = 0
var target
var vel = Vector2()
var dam = 0
var proj = preload("res://Scenes/Projectiles/Mobs/enprojwasp.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
var nbsig = 5
var mort = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$SoundHit.set_volume_db(PlVar.son + 15)
	if PlVar.map != 3 or get_parent().bossend == 2:
		queue_free()
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if global_position.x > 230:
				target = Vector2(230, self.global_position.y)
				vel = (target - position).normalized() * 100
		else:
			if mode == 0:
				target = Vector2(230, self.global_position.y)
				vel = (target - position).normalized() * 0
				mode = 1
	if dam == 0:
		if mode == 0:
			$AnimatedSprite.set_animation("default")
		if mode == 1:
			$AnimatedSprite.set_animation("att")
		if mode == 2:
			$AnimatedSprite.set_animation("shoot")
	else:
		$AnimatedSprite.set_animation("deg")
	if lifsol <= 0:
			if mort == false:
				mort = true
				$Death.start(0.001)
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	pass


func _on_Area2D_body_entered(body):
	if PlVar.pause == 0:
		if mode == 1 and body.name == "player":
			mode = 2
			$Timer.start(0.1)
			pass
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if PlVar.pause == 0:
		if mode == 2 and body.name == "player":
			mode = 1
	pass # Replace with function body.


func _on_Timer_timeout():
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 2:
			var b = proj.instance()
			get_parent().add_child(b)
			b.global_position = $Position2D.global_position
			$Timer.start(0.1)
	pass # Replace with function body.

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and dam == 0:
		lifsol -= damage
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
			c.global_position = $solpos.global_position
			get_parent().add_child(c)
			nbsig -= 1
			$Death.start(0.1)
		else:
			var b = particule.instance()
			PlVar.kill[4] += 1
			b.global_position = self.global_position
			b.start(112, 1)
			get_parent().add_child(b)
			queue_free()
	pass # Replace with function body.
