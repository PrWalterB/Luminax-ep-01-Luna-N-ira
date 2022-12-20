extends KinematicBody2D
# warning-ignore:unused_class_variable
var vel = Vector2()
var speed = -0.3
var mode = 0
var path : = PoolVector2Array()
var lifsol = 24*PlVar.diffpro
var i8 = 0
var i9 = 0
var i7 = 0
var i11 = 0
var bullet = preload("res://Scenes/Projectiles/Mobs/enproj3.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var nbsig = 8
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
	if mode == 4:
		if $AnimatedSprite.frame == 7:
			if i7 == 0:
				var b = bullet.instance()
				b.global_position = $pos.global_position
				get_parent().get_parent().add_child(b)
				i7 = 1
		if $AnimatedSprite.frame == 8:
			if i8 == 0:
				var b = bullet.instance()
				b.global_position = $pos2.global_position
				get_parent().get_parent().add_child(b)
				i8 = 1
		if $AnimatedSprite.frame == 9:
			if i9 == 0:
				var b = bullet.instance()
				b.global_position = $pos3.global_position
				get_parent().get_parent().add_child(b)
				i9 = 1
		if $AnimatedSprite.frame == 11:
			if i11 == 0:
				var b = bullet.instance()
				b.global_position = $pos4.global_position
				get_parent().get_parent().add_child(b)
				i11 = 1
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 1:
			mode = 2
			$Timer.start(rand_range(3, 5))
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
		if lifsol <= 0 or (PlVar.map == 5 and PlVar.kill[3] == 8):
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
				$SoundHit.stream = load("res://Sons/HitSol4.wav")
			if shit >= 0.5:
				$SoundHit.stream = load("res://Sons/HitSol5.wav")
			$SoundHit.play()
			$Hit.start(0.1)
	pass

func _on_Hit_timeout():
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 1 or mode == 2:
			$AnimatedSprite.play("default")
		if mode == 3:
			$AnimatedSprite.play("prepare")
		if mode == 4:
			$AnimatedSprite.play("shoot")
	pass # Replace with function body.


func _on_vision_body_entered(body):
	if body.name == "player":
		if mode == 0:
			mode = 1
			if PlVar.map == 5 and PlVar.scenario[9] == "0":
				PlVar.action(1)
	pass # Replace with function body.


func _on_Timer_timeout():
	if mort == false:
		if mode == 3:
			$AnimatedSprite.play("shoot")
			mode = 4
		if mode == 2:
			$AnimatedSprite.play("prepare")
			mode = 3
			$Timer.start(0.0001)
	if mort == true:
		if nbsig > 0:
			var c = sigma.instance()
			c.global_position = $solpos.global_position
			get_parent().get_parent().add_child(c)
			nbsig -= 1
			$Timer.start(0.1)
		else:
			var b = particule.instance()
			PlVar.kill[2] += 1
			b.global_position = $solpos.global_position
			b.start(6, 1)
			get_parent().get_parent().add_child(b)
			get_parent().queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if mode == 4:
			mode = 1
			i7 = 0
			i8 = 0
			i9 = 0
			i11 = 0
			$AnimatedSprite.play("default")
	pass # Replace with function body.


func _on_cosmicgoo_area_exited(area):
	if "projprog4" in area.name:
		speed = -0.3
	pass # Replace with function body.


func _on_cosmicgoo_area_entered(area):
	if "projprog4" in area.name:
		speed = 0
	pass # Replace with function body.
