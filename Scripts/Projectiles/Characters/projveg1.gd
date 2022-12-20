extends KinematicBody2D
var vel = Vector2()
var speed = 3
var lifboul = 3
var target = Vector2()
var moment = 0
var invu = 0
var particule = preload("res://Scenes/Other/particle.tscn")
var sExplo = preload("res://Sons/Att1_2.wav")

func _ready():
	if PlVar.mana < 0.1:
		self.scale = Vector2(0.5, 0.5)
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
		b.start(0, 0.1)
		get_parent().add_child(b)
		lifboul -= 1
	pass

# warning-ignore:unused_argument
func _process(delta):
	$Son.set_volume_db(PlVar.son + 10)
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
		target = get_global_mouse_position()
		vel = (target - position).normalized() * speed
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "soldier" in body.name:
		if PlVar.mana < Stats.vegetstat[0][1][0]:
			body.hit(rand_range(Stats.vegetstat[0][0][0]/2, Stats.vegetstat[0][0][1]/2))
		else:
			body.hit(rand_range(Stats.vegetstat[0][0][0], Stats.vegetstat[0][0][1]))
	pass # Replace with function body.
