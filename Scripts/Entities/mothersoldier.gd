extends KinematicBody2D
# warning-ignore:unused_class_variable
var vel = Vector2()
var speed = -0.1
var mode = 0
var path : = PoolVector2Array()
var lifsol = 80*PlVar.diffpro
var bullet = preload("res://Scenes/Projectiles/Mobs/enproj2.tscn")
var sol0 = preload("res://Scenes/Entities/soldier.tscn")
var sol1 = preload("res://Scenes/Entities/bigsoldier.tscn")
var sol2 = preload("res://Scenes/Entities/unit.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var nbsig = 24
var dam = 0
var nbsol = 0
var a = sol0.instance()
var rand
var decide
var mort = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	move_pos()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$SoundHit.set_volume_db(PlVar.son + 20)
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 1:
			mode = 2
			$Timer.start(2)
		if mode == 1 or mode == 2:
			if path.size() != 0:
				if position.distance_to(path[0]) <= 0:
					path.remove(0)
					if position.distance_to(path[0]) > 0:
						# warning-ignore:return_value_discarded
						move_and_collide((position - path[0]).normalized()*speed)
				else:
					# warning-ignore:return_value_discarded
					move_and_collide((position - path[0]).normalized()*speed)
		if lifsol <= 0:
			if mort == false:
				mort = true
				$Timer.start(0.001)
		
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode != 4:
			lifsol -= damage
			$AnimatedSprite.play("hurt")
			var shit = rand_range(0, 1)
			if shit < 0.5:
				$SoundHit.stream = load("res://Sons/HitSol6.wav")
			if shit >= 0.5:
				$SoundHit.stream = load("res://Sons/HitSol7.wav")
			$SoundHit.play()
			$Hit.start(0.1)
			dam = 1
	pass

func _on_Hit_timeout():
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 1 or mode == 2 or mode == 0:
			$AnimatedSprite.play("default")
		if mode == 3:
			$AnimatedSprite.play("prepare")
		if mode == 4:
			$AnimatedSprite.play("shoot")
		dam = 0
	pass # Replace with function body.


func _on_vision_body_entered(body):
	if body.name == "player":
		if mode == 0:
			mode = 1
			if PlVar.map == 5 and PlVar.scenario[9] == "0":
				PlVar.action(12)
	pass # Replace with function body.


func _on_Timer_timeout():
	if mort == false:
		if PlVar.pause == 0 and PlVar.dialo == 0:
			if nbsol <= 100:
				if mode == 2:
					rand = rand_range(0, 1)
					if rand <= 0.89:
						a = sol0.instance()
					elif rand > 0.89 and rand <= 0.945:
						a = sol1.instance()
					else:
						a = sol2.instance()
					a.global_position = $solpos.global_position
					get_parent().get_parent().add_child(a)
					var b = particule.instance()
					b.global_position = $solpos.global_position
					b.start(14, 1)
					get_parent().get_parent().add_child(b)
					move_pos()
					nbsol += 1
					mode = 1
	if mort == true:
		if nbsig > 0:
			var c = sigma.instance()
			$solpos.position = Vector2(0,0)
			c.global_position = $solpos.global_position
			get_parent().get_parent().add_child(c)
			nbsig -= 1
			$Timer.start(0.1)
		else:
			$solpos.position.x = 0
			$solpos.position.y = 0
			var b = particule.instance()
			PlVar.kill[3] += 1
			b.global_position = $solpos.global_position
			b.start(13, 1)
			get_parent().get_parent().add_child(b)
			get_parent().queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 4:
			mode = 1
			var b = bullet.instance()
			b.global_position = $solpos.global_position
			get_parent().get_parent().add_child(b)
			$AnimatedSprite.play("default")
	pass # Replace with function body.


func _on_detect_body_entered(body):
	if "walls" in body.name:
		move_pos()
	pass # Replace with function body.

func move_pos():
	decide = rand_range(0, 1)
	if decide <= 0.5:
		$solpos.position.x = rand_range(-80, -100)
	if decide > 0.5:
		$solpos.position.x = rand_range(80, 100)
	decide = rand_range(0, 1)
	if decide <= 0.5:
		$solpos.position.y = rand_range(-65, -100)
	if decide > 0.5:
		$solpos.position.y = rand_range(40, 80)
	pass


func _on_cosmicgoo_area_exited(area):
	if "projprog4" in area.name:
		speed = -0.1
	pass # Replace with function body.


func _on_cosmicgoo_area_entered(area):
	if "projprog4" in area.name:
		speed = 0
	pass # Replace with function body.
