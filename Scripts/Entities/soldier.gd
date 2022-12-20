extends KinematicBody2D
var mode = 0
var vel = Vector2()
var path : = PoolVector2Array()
var speed = -0.8
# warning-ignore:unused_class_variable
var att = 0
var lifsol = 12*PlVar.diffpro
var dam = 0
# warning-ignore:unused_class_variable
var yep = 0
var particule = preload("res://Scenes/Other/particle.tscn")
var proj = preload("res://Scenes/Projectiles/Mobs//enproj.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var nbsig = 3
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
	$SoundHit.set_volume_db(PlVar.son + 5)
	if PlVar.map == 0:
		queue_free()
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 1:
			mode = 2
			$Timer.start(rand_range(2, 3))
		if mode == 1 or mode == 2:
			if dam == 0:
				if vel.angle() >= 1:
					$AnimatedSprite.set_animation("fm")
				if vel.angle() == 0:
					$AnimatedSprite.set_animation("f")
				if vel.angle() <= -1:
					$AnimatedSprite.set_animation("bm")
			if path.size() != 0:
				if position.distance_to(path[0]) <= 0:
					path.remove(0)
					if position.distance_to(path[0]) > 0:
						vel = (position - path[0]).normalized()*speed
						# warning-ignore:return_value_discarded
						move_and_collide(vel)
				else:
					vel = (position - path[0]).normalized()*speed
					# warning-ignore:return_value_discarded
					move_and_collide(vel)
		if lifsol <= 0 or (PlVar.map == 5 and PlVar.kill[3] == 8):
			if mort == false:
				mort = true
				$Timer.start(0.001)
	pass




func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and dam == 0:
		lifsol -= damage
		if vel.angle() >= 0:
			$AnimatedSprite.set_animation("fd")
		if vel.angle() < 0:
			$AnimatedSprite.set_animation("bd")
		var shit = rand_range(0, 1)
		if shit < 0.5:
			$SoundHit.stream = load("res://Sons/HitSol2.wav")
		if shit >= 0.5:
			$SoundHit.stream = load("res://Sons/HitSol3.wav")
		$SoundHit.play()
		$Hit.start(0.1)
		dam = 1
	pass

func _on_Hit_timeout():
	if dam == 1:
		#if mode == 1 or mode == 2:
		if vel.angle() > 0:
			$AnimatedSprite.set_animation("fm")
		if vel.angle() == 0:
			$AnimatedSprite.set_animation("f")
		if vel.angle() < 0:
			$AnimatedSprite.set_animation("bm")
		dam = 0
	pass # Replace with function body.


func _on_Timer_timeout():
	if mort == false:
		if mode == 3:
			var b = proj.instance()
			b.global_position = $solpos.global_position
			get_parent().get_parent().add_child(b)
			$Timer.start(0.5)
	if mort == true:
		if nbsig > 0:
			var c = sigma.instance()
			c.global_position = $solpos.global_position
			get_parent().get_parent().add_child(c)
			nbsig -= 1
			$Timer.start(0.1)
		else:
			var b = particule.instance()
			PlVar.kill[0] += 1
			b.global_position = $solpos.global_position
			b.start(6, 1)
			get_parent().get_parent().add_child(b)
			get_parent().queue_free()
	pass # Replace with function body.


func _on_vision_body_entered(body):
	if body.name == "player":
		if mode == 0:
			mode = 1
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_damzone_body_entered(body):
	mode = 3
	if vel.angle() >= 0:
		$AnimatedSprite.set_animation("fa")
	if vel.angle() < 0:
		$AnimatedSprite.set_animation("ba")
	$Timer.start(0.5)
	pass # Replace with function body.


func _on_damzone_body_exited(body):
	if body.name == "player":
		mode = 1
	pass # Replace with function body.


func _on_cosmicgoo_area_exited(area):
	if "projprog4" in area.name:
		speed = -0.8
	pass # Replace with function body.


func _on_cosmicgoo_area_entered(area):
	if "projprog4" in area.name:
		speed = 0
	pass # Replace with function body.
