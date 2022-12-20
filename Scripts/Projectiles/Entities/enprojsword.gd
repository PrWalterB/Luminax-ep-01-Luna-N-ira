extends KinematicBody2D
var vel = Vector2()
# warning-ignore:unused_class_variable
var speed = 6
var lifboul = 1
var target = Vector2()
var moment = 0
var invu = 0
var mode = 0
var trans = 0
var particule = preload("res://Scenes/Other/particle.tscn")

func _ready():
	$Son.set_volume_db(PlVar.son + 5)
	$Son.play()
	$Timer.start(0.1)
	$TRANS.start(0.0001)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	var collision_info = move_and_collide(vel)
	if collision_info:
		vel = vel.bounce(collision_info.normal)
		var b = particule.instance()
		b.global_position = $boulpos.global_position
		b.start(0, 0.1)
		get_parent().add_child(b)
		lifboul -= 1
	#if mode == 1:
	#	look_at(PlVar.player_pos)
	#	vel = Vector2(speed, 0).rotated(rotation)
		# warning-ignore:return_value_discarded
	#	move_and_collide(vel)
	pass

# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 1:
		$Timer.paused = true
		$Timer2.paused = true
		$TRANS.paused = true
	if PlVar.pause == 0:
		$Timer.paused = false
		$Timer2.paused = false
		$TRANS.paused = false
	$AnimatedSprite.modulate = Color(1,1,1,trans)
	$Son.set_volume_db(PlVar.son + 10)
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$Timer.start(0.1)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		#if mode == 0:
		#if mode == 1:
			
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		body.hit(rand_range(3, 5))
	pass # Replace with function body.


func _on_Timer2_timeout():
	mode = 2
	pass # Replace with function body.


func _on_TRANS_timeout():
	if trans < 1:
		trans += 0.01*PlVar.uldelta
		rotation_degrees += 2*PlVar.uldelta
		$TRANS.start(0.0001)
	else:
		if mode == 0:
			mode = 1
			look_at(PlVar.player_pos)
			vel = Vector2(speed, 0).rotated(rotation)
			$Son.stream = load("res://Sons/sword.wav")
			$Son.set_volume_db(PlVar.son + 10)
			$Son.play()
			# warning-ignore:return_value_discarded
			move_and_collide(vel)
	pass # Replace with function body.
