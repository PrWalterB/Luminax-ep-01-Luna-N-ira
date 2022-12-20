extends KinematicBody2D
var vel = Vector2()
var target = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$boom.set_volume_db(PlVar.son + 15)
	pass # Replace with function body.

func start(type, time):
	if type == 0:
		$particlespr.play("default")
	if type == 1:
		$particlespr.play("progcaillou")
	if type == 2:
		$particlespr.play("livegf")
	if type == 3:
		$particlespr.play("livegr")
	if type == 4:
		$particlespr.play("livegl")
	if type == 5:
		$particlespr.play("trans")
		$boom.set_volume_db(PlVar.son + 5)
		$boom.stream = load("res://Sons/rentrecara.wav")
		$boom.play()
	if type == 6:
		$particlespr.play("deathsol")
	if type == 7:
		$particlespr.play("DRING")
		target = PlVar.player_pos
		vel = (target - position).normalized() * 500
	if type == 8:
		$particlespr.play("excl")
		$particlespr.position.y = -32
	if type == 9:
		$particlespr.play("deathplay")
	if type == 10:
		$particlespr.play("sigma")
		$boom.set_volume_db(PlVar.son)
		$boom.stream = load("res://Sons/Mana_Gain_Sound.wav")
		$boom.play()
	if type == 11:
		$particlespr.play("exblue")
	if type == 12:
		$particlespr.play("ex34")
		$boom.stream = load("res://Sons/Explo3.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 0.5
		vec.y = 0.5
		$particlespr.set_scale(vec)
	if type == 13:
		$particlespr.play("deathsol")
		var vec = Vector2()
		vec.x = 4
		vec.y = 4
		$particlespr.set_scale(vec)
	if type == 14:
		$particlespr.play("creasol")
	if type == 15:
		$particlespr.play("smonk")
		var tail = rand_range(0.25, 1)
		$CollisionShape2D.set_disabled(true)
		$particlespr.scale = Vector2(tail, tail)
		$particlespr.set_rotation_degrees(rand_range(0, 360))
		target = Vector2(self.position.x, -10000)
		vel = (target - position).normalized() * rand_range(5, 50)
	if type == 16:
		$particlespr.play("defaultvaiss")
	if type == 17:
		z_index = 3
		$particlespr.play("ssmonk")
		var tail = rand_range(0.25, 1)
		$CollisionShape2D.set_disabled(true)
		$particlespr.scale = Vector2(tail, tail)
		$particlespr.set_rotation_degrees(rand_range(0, 360))
		target = Vector2(self.position.x, -10000)
		vel = (target - position).normalized() * rand_range(5, 50)
	if type == 18:
		z_index = 3
		$particlespr.play("elec")
		var tail = rand_range(0.25, 0.5)
		$CollisionShape2D.set_disabled(true)
		$particlespr.scale = Vector2(tail, tail)
		$particlespr.set_rotation_degrees(rand_range(0, 360))
	if type == 19:
		$particlespr.play("smonk")
		$particlespr.modulate = Color(0,0,0,1)
		var tail = rand_range(0.25, 1)
		$CollisionShape2D.set_disabled(true)
		$particlespr.scale = Vector2(tail, tail)
		$particlespr.set_rotation_degrees(rand_range(0, 360))
		target = Vector2(self.position.x, -10000)
		vel = (target - position).normalized() * rand_range(5, 50)
	if type == 20:
		$particlespr.play("defaultvio")
	if type == 21:
		$particlespr.play("fusionapp")
	if type == 22:
		$particlespr.play("fusiondapp")
	if type == 34:
		$particlespr.play("ex34")
		$boom.stream = load("res://Sons/Explo2.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 0.25
		vec.y = 0.25
		$particlespr.set_scale(vec)
	if type == 56:
		$particlespr.play("ex34")
		$boom.stream = load("res://Sons/Explo1.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 1
		vec.y = 1
		$particlespr.set_scale(vec)
	if type == 112:
		$particlespr.play("expurple")
		$boom.stream = load("res://Sons/Explo3.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 0.5
		vec.y = 0.5
		$particlespr.set_scale(vec)
	if type == 134:
		$particlespr.play("expurple")
		$boom.stream = load("res://Sons/Explo2.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 0.25
		vec.y = 0.25
		$particlespr.set_scale(vec)
	if type == 156:
		$particlespr.play("expurple")
		$boom.stream = load("res://Sons/Explo1.wav")
		$boom.play()
		var vec = Vector2()
		vec.x = 1
		vec.y = 1
		$particlespr.set_scale(vec)
	
	$Timer.start(time)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
