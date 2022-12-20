extends Node

var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var p1 = preload("res://Scenes/Projectiles/Mobs/bossproj1.tscn")
var cine = preload("res://Scenes/Cinematics/CinematicBunker.tscn")
var step = 0
var freq1 = 1
var vel = Vector2()
var target
var speed = 0.5
var turn = 0
var mov1 = 0
var mov2 = 0
var inten = 0.2
var currdial = 0
var cosmic = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.get_node("Musique").stream_paused = false
	PlVar.loop = 0
	print("Hey Brumen ! I")
	PlVar.life = PlVar.diffveg
	PlVar.mana = PlVar.manamax
	PlVar.map = 7
	currdial = 0
	PlVar.dialo = 0
	PlVar.pause = 0
	if PlVar.scenario[11] == "0":
		PlVar.scenario[11] = "1"
		PlVar.save_game()
		PlVar.chargement = 1
		$Charge.start(1)
	$Node2D/player/Black2.fondu(-0.01, 1, 1)
	turn = rand_range(0, 360)
	mov1 = rand_range(-10, 10)
	mov2 = rand_range(-10, 7)
	PlVar.bosslife = 400*PlVar.diffpro
	PlVar.maxbosslife = 400*PlVar.diffpro
	$TENT.start(0.01)
	$SOLTURN.start(0.01)
	target = $Node2D/Head.global_position
	$STEP.start(2)
	$Node2D/soldier.global_position = $Node2D/Head.global_position
	$Node2D/Head.screaming(2)
	if PlVar.scenario[8] == "2":
		PlVar.action(18)
	if PlVar.scenario[8] == "1":
		PlVar.action(40)
	$ACTIONDIAL.start(5.2)
	print("Hey Brumen ! J")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Node2D/Tog/Dring.set_volume_db(PlVar.son + 20)
	if PlVar.phase == 547 or PlVar.phase == 471:
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.dialo = 0
		PlVar.phase = 0
		PlVar.nextx = 0
		PlVar.nexty = 65
		PlVar.nextmap = 9
		PlVar.deblock = "10000"
		print("aaaaa")
		Omni.goto_scene("res://Scenes/Maps/BunkerVaisseau.tscn")
		print("aaaaa")
	if PlVar.phase == 545 or PlVar.phase == 469:
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		step = 100
		$DEATH.start(3)
	if PlVar.phase == 478:
		if step == 12:
			$Node2D/Tog.global_position = Vector2(0,110)
			$Node2D/Tog.set_animation("05Tog")
			$Node2D/Progfer.set_animation("00Progfer")
			$Node2D/Doubliks.set_animation("00Doubliks")
			PlVar.sens = 0
			$Node2D/Tog.set_visible(true)
			$Node2D/Tog.play()
			$Node2D/Tog/Timer.start(0.001)
			step = 12.5
	if PlVar.phase == 455 or PlVar.phase == 526:
		if step == 16 or step == 18:
			PlVar.kelmus = 13
			PlVar.loop = 0
			step += 1
			$Node2D/OlHolo.set_animation("00OlDApp")
			$Node2D/OlHolo.play()
	if PlVar.phase == 433 or PlVar.phase == 503:
		if step == 15 or step == 17:
			step += 1
			PlVar.kelmus = 14
			PlVar.loop = 0
			if PlVar.scenario[8] == "1":
				$Node2D/OlHolo.global_position = Vector2(25, 15)
			$Node2D/OlHolo.set_animation("00OlApp")
			$Node2D/OlHolo.set_visible(true)
			$Node2D/OlHolo.play()
	if PlVar.phase == 432 or PlVar.phase == 502:
		if step == 14 or step == 16:
			$Node2D/Tog/Dring.play()
			step +=1
	if PlVar.phase == 422:
		$Node2D/Tog.set_animation("00Tog")
	if PlVar.phase == 418 or PlVar.phase == 488:
		PlVar.get_node("Musique").stream_paused = true
		PlVar.phase += 1
		PlVar.dialo = 1
		step = 13
		$DEATH.start(0.01)
	$Node2D/Scream.set_volume_db(PlVar.son + 30)
	if PlVar.pause != 0:
		$ATT1.paused = true
		$ACTIONDIAL.paused = true
		$STEP.paused = true
		speed = 0
	else:
		$ATT1.paused = false
		$ACTIONDIAL.paused = false
		$STEP.paused = false
		if cosmic == 1:
			speed = 0.5
		if cosmic == 0:
			speed = 0
	PlVar.zoom = 0.45
	if PlVar.bosslife < PlVar.maxbosslife/2 and (step == 0 or step == 1 or step == 2):
		step = 3
		freq1 = 0.5
		$Node2D/Head.screaming(4)
		$STEP.start(4)
	
	$Node2D/Tentacle1.rotation_degrees = mov1
	$Node2D/Tentacle2.rotation_degrees = mov2
	vel = (target - $Node2D/soldier.global_position).normalized() * speed
	$Node2D/soldier.rotation_degrees = turn
	if step == 2 or step == 5:
		$Node2D/soldier.move_and_collide(vel)
		target = $Node2D/player.global_position
		$Node2D/soldier/CollisionShape2D.disabled = false
	else:
		$Node2D/soldier.move_and_collide(vel)
		target = $Node2D/Head.global_position
		if $Node2D/soldier.global_position == $Node2D/Head.global_position:
			$Node2D/soldier/CollisionShape2D.disabled = true
	if PlVar.bosslife <= 0:
		if step < 10:
			step = 10
			PlVar.get_node("Musique").stream_paused = true
			PlVar.save_succ(5)
			$Node2D/Head.screaming(8)
			PlVar.pause = 1
			if PlVar.life <= 0:
				PlVar.life = 10
			PlVar.map = 8
			$Node2D/player/Black2.fondu(0.08, 0, 1)
			$DEATH.start(10)
	pass


func _on_ATT1_timeout():
	if step == 1 or step == 4 or step == 5:
		$ATT1.start(freq1)
		var b = p1.instance()
		b.global_position = Vector2(rand_range(-13, 82), rand_range(-27, 92))
		get_parent().add_child(b)
		var c = p1.instance()
		c.global_position = $Node2D/player.global_position
		get_parent().add_child(c)
		pass
	pass # Replace with function body.


func _on_STEP_timeout():
	if step == 2 or step == 5:
		step -= 2
		target = $Node2D/Head.global_position
		$STEP.start(2)
		pass
	if step == 1 or step == 4:
		target = $Node2D/player.global_position
		$STEP.start(10)
		$Node2D/Head.trembl = 10
		$Node2D/Scream.play()
		inten = 0.3
		if step == 4:
			inten = 0.5
			$Node2D/Head.trembl = 15
		step += 1
		$Node2D/Head/AnimatedSprite.play("scream")
		pass
	if step == 0 or step == 3:
		target = $Node2D/Head.global_position
		$ATT1.start(freq1)
		$STEP.start(20)
		$Node2D/Head/AnimatedSprite.play("default")
		$Node2D/Head.trembl = 5
		inten = 0.1
		if step == 3:
			inten = 0.3
			$Node2D/Head.trembl = 10
		step += 1
		
		pass
	pass # Replace with function body.


func _on_SOLTURN_timeout():
	turn += 2*PlVar.uldelta
	$SOLTURN.start(0.01)
	pass # Replace with function body.


func _on_TENT_timeout():
	mov1 += rand_range(-inten, inten)*PlVar.uldelta
	mov2 += rand_range(-inten, inten)*PlVar.uldelta
	if mov2 > 7:
		mov2 = 7
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_ACTIONDIAL_timeout():
	PlVar.phaction = 0
	PlVar.messf = ""
	if step < 10:
		currdial += 1
		if PlVar.scenario[8] == "2":
			if currdial < 22:
				PlVar.action(18 + currdial)
				$ACTIONDIAL.start(PlVar.vitphac + 0.1)
		if PlVar.scenario[8] == "1":
			if currdial < 16:
				PlVar.action(40 + currdial)
				$ACTIONDIAL.start(PlVar.vitphac + 0.1)
	pass # Replace with function body.


func _on_DEATH_timeout():
	if step == 100:
		PlVar.phase += 1
		step = 101
		pass
	if step == 13:
		PlVar.dialo = 0
		PlVar.phase = 0
		var b = cine.instance()
		get_parent().add_child(b)
		step = 14
		pass
	if step == 11:
		PlVar.kelmus = 13
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
		if PlVar.scenario[8] == "2":
			PlVar.phase = 409
		if PlVar.scenario[8] == "1":
			PlVar.phase = 472
		step = 12
		pass
	if step == 10:
		PlVar.sens = 1
		PlVar.perso = 0
		PlVar.cara = 0
		$Node2D/player.global_position = Vector2(0,0)
		$Node2D/Progfer.set_visible(true)
		$Node2D/Doubliks.set_visible(true)
		if PlVar.scenario[8] == "2":
			$Node2D/Tog.set_visible(true)
		$Node2D/Head.set_visible(false)
		$Node2D/Tentacle1.set_visible(false)
		$Node2D/Tentacle2.set_visible(false)
		$Node2D/Tentacle3.set_visible(false)
		$Node2D/soldier.set_visible(false)
		$Node2D/player/Black2.fondu(-0.005, 1, 1)
		step = 11
		$DEATH.start(2)
		pass
	pass # Replace with function body.

func _on_OlHolo_animation_finished():
	if $Node2D/OlHolo.animation == "00OlApp":
		$Node2D/OlHolo.set_animation("00OlH")
	if $Node2D/OlHolo.animation == "00OlDApp":
		$Node2D/OlHolo.set_visible(false)
	pass # Replace with function body.


func _on_Timer_timeout():
	if $Node2D/Tog.global_position.y > 36:
		$Node2D/Tog.global_position.y -= 0.1*PlVar.uldelta
		$Node2D/Tog/Timer.start(0.01)
	if $Node2D/Tog.global_position.y <= 36:
		$Node2D/Tog.set_animation("01Tog")
	pass # Replace with function body.
