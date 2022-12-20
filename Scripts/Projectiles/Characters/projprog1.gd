extends KinematicBody2D
var vel = Vector2()
var speed = 0.2
var lifboul = 1
var target = Vector2()
var moment = 0
var invu = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
# warning-ignore:unused_class_variable
var sCREATE = preload("res://Sons/att1progfer.wav")
var sSEND = preload("res://Sons/att1progferlaunch.wav")
var sDEST = preload("res://Sons/att1progferadieu.wav")

func _ready():
	$Son.set_volume_db(PlVar.son+10)
	$Son.play()
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
		lifboul -= 1
	pass

# warning-ignore:unused_argument
func _process(delta):
	$Son.set_volume_db(PlVar.son+10)
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$Son.stream = sDEST
			$Son.play()
			$AnimatedSprite.play("explode")
			$Timer.start(0.1)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 1:
		$Son.stream = sSEND
		$Son.play()
		moment = 3
		speed = 24
		target = get_global_mouse_position()
		vel = (target - position).normalized() * speed
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		var rotation_dir = randi()
		rotation += rotation_dir * speed
		vel = Vector2(speed, 0).rotated(rotation)
		$Timer.start(3)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "soldier" in body.name:
		if PlVar.mana < Stats.progferstat[0][1][0]:
			body.hit(rand_range(Stats.progferstat[0][0][0]/2, Stats.progferstat[0][0][1]/2))
		else:
			 body.hit(rand_range(Stats.progferstat[0][0][0], Stats.progferstat[0][0][1]))
	pass # Replace with function body.
