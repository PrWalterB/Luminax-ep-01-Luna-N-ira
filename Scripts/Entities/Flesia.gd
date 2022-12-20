extends Node2D
var vel = Vector2()
var vel2 = Vector2()
var rotation_dir
var taille
var target
var speed = 1
var turn = 0
var incr = 1
var mode = 0
var lifsol = 20*PlVar.diffpro
var att = 0
var pers
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	incr = rand_range(-1.5, 1.5)
	turn = rand_range(0, 1080)
	$soldier/Pistils.set_rotation_degrees(rand_range(0, 1080))
	taille = rand_range(0.5, 1.5)
	self.scale = Vector2(taille, taille)
	$soldier/Petales.modulate = Color(rand_range(0.000000, 1.000000), 1, rand_range(0.000000, 0.500000), 1)
	$TURN.start(0.001)
	speed = speed * taille
	lifsol = lifsol * taille
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	#soldier
	$soldier/Area2D/SoundAtt.set_volume_db(PlVar.son + 5)
	$soldier/SoundHit.set_volume_db(PlVar.son + 5)
	$soldier/Petales.set_rotation_degrees(turn)
	if mode == 0 or PlVar.scenario[16] == "1":
		target = self.global_position
		$TURN.set_paused(true)
	if mode == 1 and PlVar.scenario[16] != "1":
		target = PlVar.player_pos
		$TURN.set_paused(false)
	if PlVar.pause == 0 and PlVar.dialo == 0 and mode != 2:
		vel2 = (target - $soldier.global_position).normalized() * speed
		$soldier.move_and_collide(vel2)
	if mode == 2:
		$soldier/Area2D/CollisionShape2D.set_disabled(true)
		$vision/CollisionShape2D.set_disabled(true)
		$soldier/CollisionShape2D.set_disabled(true)
		
		self.modulate = Color(0.5,0.5,0.5,1)
	
	#Tige
	vel = ($soldier.position - $Tige.position).normalized()
	$Tige.scale.x = sqrt(pow($soldier.global_position.x-$Tige.global_position.x, 2)+pow($soldier.global_position.y-$Tige.global_position.y, 2))/(64*taille)
	rotation_dir = vel.angle()
	$Tige.rotation = rotation_dir
	pass


func _on_vision_body_entered(body):
	if body.name == "player":
		$soldier/Pistils.play("default")
		mode = 1
	pass # Replace with function body.


func _on_TURN_timeout():
	turn += incr*PlVar.uldelta
	$TURN.start(0.001)
	pass # Replace with function body.


func _on_vision_body_exited(body):
	if body.name == "player":
		$soldier/Pistils.stop()
		mode = 0
	pass # Replace with function body.

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and mode != 2:
		lifsol -= damage
		$soldier/Petales.set_animation("dam")
	pass

func _on_HIT_timeout():
	if mode != 2:
		$soldier/Petales.set_animation("default")
	else:
		$soldier/Petales.set_animation("die")
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if att == 0:
			if body.name == "player":
				pers = body
				att = 1
				body.hit(rand_range(0.5, 1))
				var shit = rand_range(0, 1)
				if shit < 0.5:
					$soldier/Area2D/SoundAtt.stream = load("res://Sons/fleuratt1.wav")
				if shit >= 0.5:
					$soldier/Area2D/SoundAtt.stream = load("res://Sons/fleuratt2.wav")
				$soldier/Area2D/SoundAtt.play()
				$ATT.start(0.05)
	pass # Replace with function body.


func _on_ATT_timeout():
	if att == 1:
		pers.hit(rand_range(0.5, 1))
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if att == 1:
		if body.name == "player":
			att = 0
	pass # Replace with function body.
