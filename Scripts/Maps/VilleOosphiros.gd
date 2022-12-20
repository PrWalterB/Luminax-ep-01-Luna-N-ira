extends Node
var cara = 0
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var part = preload("res://Scenes/Other/particle.tscn")
var remphase = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 5
#	$Node2D/player.position = Vector2(1360,1526)
	if OS.get_datetime()["hour"] == 13 and OS.get_datetime()["minute"] == 12:
		$Node2D/teuf/cyberurier.volume_db = PlVar.son + 20
		$Node2D/teuf/cyberurier.play()
	else:
		$Node2D/teuf.queue_free()
	$Node2D/Convoi/Tog/fleche1.supguide = 0
	$Node2D/Convoi/Tog/fleche2.supguide = 0
	$Node2D/fleche0.supguide = 0
	PlVar.get_node("Musique").stream_paused = true
	PlVar.kill = [0, 0, 0, 0, 0, 0, 0]
	if PlVar.scenario[8] == "2":
		$Node2D/Convoi.set_visible(false)
		get_node("Node2D/1meetogdial/CollisionShape2D").set_disabled(true)
		$Node2D/walls/poltog.set_disabled(true)
		get_node("Node2D/1choicetogdial/CollisionPolygon2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/0000228/CollisionShape2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/0000277/CollisionShape2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/soldier/0000238/CollisionShape2D").set_disabled(true)
		if PlVar.scenario[9] == "0":
			$ActionDial.start(3)
			PlVar.get_node("Musique").stream_paused = false
			PlVar.kelmus = 9
			PlVar.loop = 0
	if PlVar.scenario[9] == "1":
		PlVar.action(16)
		$Node2D/fleche0.supguide = 1
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 6
		PlVar.loop = 0
	if PlVar.scenario[6] == "1":
		$Node2D/Progfer.set_visible(false)
		$Node2D/Doublix.set_visible(false)
	if PlVar.scenario[6] == "0":
		print("cacaprout")
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
		PlVar.phase = 158
		PlVar.scenario[6] = "1"
		PlVar.deblock[1] = "1"
		PlVar.deblock[2] = "1"
		PlVar.chargement = 1
		PlVar.save_game()
		$Charge.start(1)
	
	

		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if remphase == 2:
		PlVar.dialo = 0
		PlVar.phase = 0
		remphase = 0
		$Node2D/player/Black2.fondu(-0.01, 1)
	if PlVar.phase == 172:
#		var b = part.instance()
#		b.global_position = $Node2D/Convoi/Progfer.global_position
#		b.start(5, 0.2)
#		get_parent().add_child(b)
#		var c = part.instance()
#		c.global_position = $Node2D/Convoi/Doublix.global_position
#		c.start(5, 0.2)
#		get_parent().add_child(c)
		remphase = 3
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.dialo = 1
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.cara = 0
		PlVar.last = "0123"
		PlVar.sens = 2
		PlVar.phase = 173
		$Timer.start(3)
		
	if $Node2D/Convoi/Tog.global_position.x - $Node2D/player.global_position.x <= 40 and PlVar.phase == 173:
		$Node2D/Convoi/Tog.play("stop")
		$Node2D/Convoi/Tog/HydSol.play("stop")
		var d = dialogb.instance()
		get_parent().add_child(d)
		remphase = 0
		PlVar.dialo = 1
		PlVar.phase = 174
		PlVar.save_succ(1)
		
	if PlVar.phase == 200:
		PlVar.messf = ""
		PlVar.dialo = 1
		PlVar.phase = 201
		$Timer.start(1)
	if PlVar.phase == 225:
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase = 226
		$Timer.start(3)
	if PlVar.phase == 227:
		$Node2D/Convoi/Progfer.set_visible(false)
		$Node2D/Convoi/Doublix.set_visible(false)
		$Node2D/Convoi/Tog/doobliks.set_visible(false)
		PlVar.dialo = 0
		$Node2D/Convoi/Tog/fleche1.supguide = 1
		$Node2D/Convoi/Tog/fleche2.supguide = 1
		PlVar.deblock[4] = "1"
		PlVar.phase = 0
		$Node2D/player/Black2.fondu(-0.01, 1)

	if PlVar.phase == 233 or PlVar.phase == 280:
		if PlVar.phase == 280:
			PlVar.save_succ(2)
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 235:
		PlVar.kelmus = 9
		PlVar.loop = 0
		$Node2D/Convoi.set_visible(false)
		$Node2D/Convoi/Tog/walls/CollisionShape2D.set_disabled(true)
		$Node2D/Convoi/Tog/walls/CollisionShape2D2.set_disabled(true)
		$Node2D/Convoi/Tog/walls/CollisionShape2D3.set_disabled(true)
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.dialo = 0
		PlVar.deblock[3] = "1"
		PlVar.scenario[8] = "2"
		$ActionDial.start(5)
		$Node2D/walls/poltog.set_disabled(true)
		get_node("Node2D/1choicetogdial/CollisionPolygon2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/0000228/CollisionShape2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/0000277/CollisionShape2D").set_disabled(true)
		get_node("Node2D/Convoi/Tog/soldier/0000238/CollisionShape2D").set_disabled(true)
		PlVar.phase = 0
		PlVar.save_game()
		$Node2D/player/Black2.fondu(-0.01, 1)
	if PlVar.phase == 282:
		$Node2D/Convoi.set_visible(false)
		$Node2D/Convoi/Tog/walls/CollisionShape2D.set_disabled(true)
		$Node2D/Convoi/Tog/walls/CollisionShape2D2.set_disabled(true)
		$Node2D/Convoi/Tog/walls/CollisionShape2D3.set_disabled(true)
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.dialo = 0
		PlVar.phase = 0
		PlVar.nextx = -23
		PlVar.nexty = -623
		PlVar.nextmap = 6
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
		
	if PlVar.phaction == 16:
		if PlVar.scenario[9] == "0":
			PlVar.scenario[9] = "1"
			$Node2D/fleche0.supguide = 1
			PlVar.get_node("Musique").stream_paused = false
			PlVar.kelmus = 5
			PlVar.loop = 0
			PlVar.save_succ(3)
			PlVar.chargement = 1
			PlVar.save_game()
			$Charge.start(1)
	if PlVar.phase == -2:
		print("Hey Brumen ! 4")
		$Timer.start(3)
		PlVar.phase = -1001
	
	if PlVar.phase == 206:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 8
		PlVar.loop = 0
		PlVar.messf = ""
		var d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/Convoi/Progfer.global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/Convoi/Doublix.global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/Convoi/Tog.global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/Convoi/Tog/HydSol.global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/Convoi/Tog/doobliks.global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/player.global_position
		get_parent().add_child(d)
		PlVar.dialo = 1
		$Node2D/player/Camera2D.shake(5,10,10)
		PlVar.phase = 207
		$Timer.start(5)

	if PlVar.phase == 203 and $Node2D/Convoi/Tog/doobliks.global_position.y >= $Node2D/player.global_position.y:
		$Node2D/Convoi/Tog/doobliks.play("free")
		$Node2D/Convoi/Tog.play("stop")
		var d = dialogb.instance()
		get_parent().add_child(d)
		PlVar.dialo = 1
		PlVar.phase = 204
	if PlVar.phase == 208:
		var d = dialogb.instance()
		get_parent().add_child(d)
		PlVar.dialo = 1
		PlVar.phase = 209

	if PlVar.phase == 161 or PlVar.phase == 176 or (PlVar.phase >= 193 and PlVar.phase <= 198) or (PlVar.phase >= 207 and PlVar.phase <= 209):
		$Node2D/Progfer.set_animation("stress")
		$Node2D/Convoi/Progfer.set_animation("stress")
	elif PlVar.phase >= 210 and PlVar.phase <= 220:
		$Node2D/Progfer.set_animation("cara")
		$Node2D/Convoi/Progfer.set_animation("cara")
	elif PlVar.phase == 162 or PlVar.phase == 210:
		$Node2D/Progfer.set_animation("cara")
		$Node2D/Convoi/Progfer.set_animation("cara")
		if cara == 0:
			var b = part.instance()
			if PlVar.phase == 162:
				b.global_position = $Node2D/Progfer.global_position
			else:
				b.global_position = $Node2D/Convoi/Progfer.global_position
			b.start(5, 0.2)
			get_parent().add_child(b)
			cara = 1
	elif PlVar.phase == 163 or PlVar.phase == 211 or PlVar.phase == 221:
		if cara == 1:
			var b = part.instance()
			if PlVar.phase == 163:
				b.global_position = $Node2D/Progfer.global_position
			else:
				b.global_position = $Node2D/Convoi/Progfer.global_position
			b.start(5, 0.2)
			get_parent().add_child(b)
			cara = 0
			$Node2D/Progfer.set_animation("default")
			$Node2D/Convoi/Progfer.set_animation("default")
	elif PlVar.phase == 165:
#		var b = part.instance()
#		b.global_position = $Node2D/Progfer.global_position
#		b.start(5, 0.2)
#		get_parent().add_child(b)
#		var c = part.instance()
#		c.global_position = $Node2D/Doublix.global_position
#		c.start(5, 0.2)
#		get_parent().add_child(c)
		remphase = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		$Remptimer.start(3)
		PlVar.dialo = 1
	else:
		$Node2D/Progfer.set_animation("default")
		$Node2D/Convoi/Progfer.set_animation("default")
	if PlVar.phase == 1432:
		PlVar.save_succ(52)
	pass


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_Timer_timeout():
	if PlVar.phase == -1001:
		print("Hey Brumen ! 5")
		PlVar.nextx = -23
		PlVar.nexty = -623
		PlVar.nextmap = 6
		PlVar.mort = 0
		PlVar.dialo = 0
		PlVar.pause = 0
		PlVar.phase = 0
		print("Hey Brumen ! 6")
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
		print("Hey Brumen ! 7")
	if PlVar.phase == 234 or PlVar.phase == 281:
		PlVar.phase += 1
		pass
	if PlVar.phase == 226:
		PlVar.phase = 227
		pass
	if PlVar.phase == 207:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 2
		PlVar.loop = 0
		PlVar.phase = 208
		pass
	if PlVar.phase == 173:
		if remphase == 4:
			if $Node2D/Convoi/Tog.global_position.x - $Node2D/player.global_position.x >= 40:
				$Node2D/Convoi/Tog.global_position.x -= 1
				$Timer.start(0.001)
		if remphase == 3:
			PlVar.get_node("Musique").stream_paused = false
			PlVar.kelmus = 6
			PlVar.loop = 0
			$Node2D/Convoi.set_visible(true)
			$Node2D/Convoi/Doublix.global_position.x = $Node2D/player.global_position.x + 21
			$Node2D/Convoi/Doublix.global_position.y = $Node2D/player.global_position.y - 26
			$Node2D/Convoi/Progfer.global_position.x = $Node2D/player.global_position.x - 21
			$Node2D/Convoi/Progfer.global_position.y = $Node2D/player.global_position.y + 16
			$Node2D/Convoi/Tog.global_position.x = $Node2D/player.global_position.x + (231*(2.22222222*PlVar.zoom)) + 12
			$Node2D/Convoi/Tog.global_position.y = $Node2D/player.global_position.y
			get_node("Node2D/1meetogdial/CollisionShape2D").set_disabled(true)
			$Node2D/Convoi/Tog/walls/CollisionShape2D.set_disabled(false)
			$Node2D/Convoi/Tog/walls/CollisionShape2D2.set_disabled(false)
			$Node2D/Convoi/Tog/walls/CollisionShape2D3.set_disabled(false)
			remphase += 1
			$Node2D/player/Black2.fondu(-0.01, 1)
			$Timer.start(0.001)
	if PlVar.phase == 203 and $Node2D/Convoi/Tog/doobliks.global_position.y <= $Node2D/player.global_position.y:
		$Node2D/Convoi/Tog/doobliks.stop()
		$Node2D/Convoi/Tog/doobliks.global_position.y += 1
	if PlVar.phase == 202:
		$Node2D/Convoi/Tog/bubule.set_visible(false)
		PlVar.phase = 203
		$Timer.start(0.001)
	if PlVar.phase == 201:
		$Node2D/Convoi/Tog.play("turn")
		$Timer.start(1)
		PlVar.phase = 202
	pass # Replace with function body.


func _on_ActionDial_timeout():
	PlVar.action(11)
	pass # Replace with function body.


func _on_cyberurier_finished():
	$Node2D/teuf/cyberurier.play()
	pass # Replace with function body.


func _on_Remptimer_timeout():
	if remphase == 1:
		$Node2D/Progfer.set_visible(false)
		$Node2D/Doublix.set_visible(false)
		PlVar.tuto = 4
		PlVar.dialo = 1
		remphase += 1
	pass # Replace with function body.
