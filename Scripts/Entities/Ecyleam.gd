extends KinematicBody2D
var mode = 0
var trans = 0
var soul = 1
var transoul = 1
var fase = 0.1
var proj = preload("res://Scenes/Projectiles/Mobs/enprojsword.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var nbsw = 3
var dam = 0
# warning-ignore:unused_class_variable
var vel = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.bosslife = 200*PlVar.diffpro
	PlVar.maxbosslife = 200*PlVar.diffpro
	print("BARBARA !! B")
	PlVar.get_node("Musique").stream_paused = true
	$AnimatedSprite.play("app")
	$APP.start(0.0001)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 1:
		$APP.paused = true
		$SOUL.paused = true
		$WAIT.paused = true
	if PlVar.pause == 0:
		$APP.paused = false
		$SOUL.paused = false
		$WAIT.paused = false
	$SoulSound.set_volume_db(PlVar.son + 10)
	$SoundHit.set_volume_db(PlVar.son + 10)
	$AnimatedSprite.modulate = Color(1,1,1,trans)
	$Soul.modulate = Color(1,1,1,transoul)
	$Soul.scale = Vector2(soul, soul)
	if transoul > 0 and $Soul.visible == true:
		 $Soul/Area2D/CollisionPolygon2D.set_disabled(false)
	else:
		$Soul/Area2D/CollisionPolygon2D.set_disabled(true)
	if mode == 2:
		print("BARBARA !! G")
		$AnimatedSprite.play("tp")
		$CollisionShape2D.set_disabled(true)
		$Soul.set_visible(false)
		transoul = 1
		soul = 1
		mode = 3
	if PlVar.bosslife < PlVar.maxbosslife/2:
		fase = 0.15
	if PlVar.bosslife <= 0 and mode < 6:
		PlVar.save_succ(12)
		$SoulSound.play()
		$Soul.set_visible(true)
		transoul = 1
		soul = 1
		$AnimatedSprite.play("dapp")
		$APP.start(0.0001)
		$SOUL.start(0.0001)
		$WAIT.start(5)
		mode = 6
	pass


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "app":
		print("BARBARA !! D")
		$AnimatedSprite.set_animation("default")
		$SoulSound.play()
		$Soul.set_visible(true)
		$SOUL.start(0.0001)
		mode = 1
		PlVar.kelmus = 20
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		PlVar.bosslife = 200*PlVar.diffpro
		PlVar.maxbosslife = 200*PlVar.diffpro
		get_parent().get_node("CanvasLayer").bossf(3)
		PlVar.scenario[16] = "2"
	if $AnimatedSprite.animation == "tp2":
		$AnimatedSprite.animation = "default"
		$CollisionShape2D.set_disabled(false)
		$SoulSound.play()
		$Soul.set_visible(true)
		var b = sigma.instance()
		get_parent().add_child(b)
		b.global_position.x = rand_range(self.global_position.x + 50, self.global_position.x - 50)
		b.global_position.y = rand_range(self.global_position.y + 50, self.global_position.y - 50)
		$SOUL.start(0.0001)
		mode = 4
		$WAIT.start(1)
	if $AnimatedSprite.animation == "tp":
		self.global_position.x = rand_range(PlVar.player_pos.x + 100, PlVar.player_pos.x - 100)
		self.global_position.y = rand_range(PlVar.player_pos.y + 100, PlVar.player_pos.y - 100)
		$AnimatedSprite.play("tp2")
	pass # Replace with function body.


func _on_APP_timeout():
	if mode < 6:
		if trans < 1:
			print("BARBARA !! C")
			trans += 0.01*PlVar.uldelta
			$APP.start(0.0001)
	else:
		if trans > 0:
			trans -= 0.01*PlVar.uldelta
			$APP.start(0.0001)
	pass # Replace with function body.


func _on_SOUL_timeout():
	if transoul > 0 and mode == 1:
		print("BARBARA !! E")
		transoul -= 0.01
		soul += 1
		$SOUL.start(0.0001)
	else:
		if mode == 1:
			print("BARBARA !! F")
			mode = 2
	if transoul > 0 and mode == 4:
		transoul -= 0.05
		soul += fase
		$SOUL.start(0.0001)
	if transoul > 0 and mode == 6:
		transoul -= 0.01
		get_parent().transtat += 0.01
		soul += 1
		$SOUL.start(0.0001)
			
	pass # Replace with function body.


func _on_vision_body_entered(body):
	if body.name == "player" and (mode == 1 or mode == 4):
		mode = 2
	pass # Replace with function body.


func _on_WAIT_timeout():
	if mode == 6:
		PlVar.scenario[16] = "1"
		PlVar.save_game()
		PlVar.chargement = 1
		get_parent().get_node("Node2D/Dialogues/0000877/CollisionPolygon2D").set_disabled(false)
		get_parent().get_node("Node2D/Dialogues/0000877").name = "0000900"
		get_parent().get_node("Charge").start(3)
		PlVar.kelmus = 21
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		queue_free()
	if mode == 5:
		mode = 2
	if nbsw > 0 and mode == 4:
		var b = proj.instance()
		get_parent().add_child(b)
		b.global_position.x = rand_range(self.global_position.x + 50, self.global_position.x - 50)
		b.global_position.y = rand_range(self.global_position.y + 50, self.global_position.y - 50)
		nbsw -=1
		$WAIT.start(1)
	else:
		mode = 2
		nbsw = 3
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if fase == 0.1:
			body.hit(rand_range(1, 3))
		else:
			body.hit(rand_range(1, 5))
	pass # Replace with function body.

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and dam == 0 and mode == 4:
		$AnimatedSprite.set_animation("dam")
		PlVar.bosslife -= damage
		$Hit.start(0.1)
		dam = 1
		$SoundHit.play()
	pass

func _on_Hit_timeout():
	if mode == 4:
		$AnimatedSprite.set_animation("default")
		dam = 0
	pass # Replace with function body.
