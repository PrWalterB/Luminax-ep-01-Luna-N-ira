extends KinematicBody2D
var vel = Vector2()
# warning-ignore:unused_class_variable
var speed = 3
var lifboul = 1
var target = Vector2()
var moment = 0
var invu = 0
var mode = 0
var particule = preload("res://Scenes/Other/particle.tscn")
var sExplo = preload("res://Sons/proj_vai.wav")

func _ready():
	$AnimatedSprite.play("send")
	$Timer.start(0.1)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	var collision_info = move_and_collide(vel)
	if collision_info:
		$Son.play()
		vel = vel.bounce(collision_info.normal)
		var b = particule.instance()
		b.global_position = $boulpos.global_position
		b.start(20, 0.1)
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
	$Son.set_volume_db(PlVar.son)
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$Son.stream = sExplo
			$Son.play()
			$AnimatedSprite.play("explode")
			$Timer.start(0.1)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		if mode == 0:
			target = Vector2(-10000,0)
			vel = (target - position).normalized() * speed
		if mode == 1:
			look_at(PlVar.player_pos)
			vel = Vector2(speed, 0).rotated(rotation)
			# warning-ignore:return_value_discarded
			move_and_collide(vel)
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		body.hit(rand_range(1, 3))
	pass # Replace with function body.


func _on_Timer2_timeout():
	mode = 2
	pass # Replace with function body.
