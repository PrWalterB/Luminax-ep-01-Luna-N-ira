extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var sct = 0
var remphase = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 6
#	$Node2D/player.position = Vector2(-14,-521)
	PlVar.save_succ(4)
	if PlVar.scenario[8] == "0":
		PlVar.scenario[8] = "1"
		PlVar.save_game()
		PlVar.chargement = 1
		$Charge.start(3)
	if PlVar.scenario[10] == "1":
		get_node("Node2D/PNJ/00Anddr1").queue_free()
		get_node("Node2D/PNJ/00Hsol1").queue_free()
		get_node("Node2D/PNJ/00Hsol2").queue_free()
		get_node("Node2D/PNJ/01Progfer1").queue_free()
		get_node("Node2D/PNJ/01Doubliks1").queue_free()
		get_node("Node2D/PNJ/03Tog1").queue_free()
		get_node("Node2D/PNJ/01Progfer2").set_visible(true)
		PlVar.kelmus = 11
		PlVar.loop = 0
	if PlVar.scenario[8] == "2":
		get_node("Node2D/PNJ/03Hsol1").queue_free()
		get_node("Node2D/PNJ/01Progfer2/0000350/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00Doobliks2/0000354/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00Doublix1/0000356/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/03HsolSANS4/0000366/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00HFsolSANS1/0000368/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/03HsolSANS4").chara = "00HsolSANS"
		get_node("Node2D/PNJ/03HsolSANS4").position = Vector2(116, -13)
		PlVar.kelmus = 10
		PlVar.loop = 0
		
	else:
		get_node("Node2D/PNJ/03Hsol2").queue_free()
		get_node("Node2D/PNJ/03Tog2").queue_free()
		get_node("Node2D/PNJ/01Progfer2/0000333/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00Doobliks2/0000339/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00Doublix1/0000344/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/03HsolSANS4/0000370/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00HFsolSANS1/0000301/CollisionShape2D").set_disabled(true)
		get_node("Node2D/PNJ/00HFsolSANS1").chara = "03HFsolSANS"
		get_node("Node2D/PNJ/00HFsolSANS1").position = Vector2(109, -329)
		PlVar.kelmus = 10
		PlVar.loop = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.kelmus != 12 and (PlVar.phase == 387 or PlVar.phase == 401):
		PlVar.kelmus = 12
		PlVar.loop = 0
	if PlVar.scenario[10] == "0":
		if PlVar.phase == 283 or PlVar.phase == 245:
			if remphase == 0:
				PlVar.dialo = 1
				$Remptimer.start(3)
				remphase = 1
				$Node2D/player/Black2.fondu(0.01, 0)
	if PlVar.phase == 289 or PlVar.phase == 274:
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 291 or PlVar.phase == 276:
		PlVar.scenario[10] = "1"
		PlVar.deblock = "10000"
		PlVar.save_game()
		PlVar.chargement = 1
		$Charge.start(1)
		get_node("Node2D/PNJ/00Anddr1").queue_free()
		get_node("Node2D/PNJ/00Hsol1").queue_free()
		get_node("Node2D/PNJ/00Hsol2").queue_free()
		get_node("Node2D/PNJ/01Progfer1").queue_free()
		get_node("Node2D/PNJ/01Doubliks1").queue_free()
		get_node("Node2D/PNJ/03Tog1").queue_free()
		get_node("Node2D/PNJ/01Progfer2").set_visible(true)
		PlVar.dialo = 0
		PlVar.phase = 0
		$Node2D/player/Black2.fondu(-0.01, 1)
	if PlVar.phase == 269:
		get_node("Node2D/PNJ/01Progfer1").chara = "stress"
	else:
		if PlVar.scenario[10] != "1":
			get_node("Node2D/PNJ/01Progfer1").chara = "01Progfer"
	
	if PlVar.phase == 381 or PlVar.phase == 395:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 392 or PlVar.phase == 406:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 8
		PlVar.loop = 0
		$Node2D/player/Camera2D.shake(5,10,10)
		$Node2D/player/Black2.fondu(0.01, 0, 1)
		PlVar.phase += 1
		$Timer.start(6)
		$BOSSF.start(2)
	if PlVar.phase == 383 or PlVar.phase == 397:
		$Node2D/player/Black2.fondu(-0.01, 1)
		get_node("Node2D/PNJ/02Progfer3").set_visible(true)
		get_node("Node2D/PNJ/03Doublix1").set_visible(true)
		get_node("Node2D/PNJ/00Doobliks3").set_visible(true)
		PlVar.phase += 1
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
	if PlVar.phase == 394 or PlVar.phase == 408:
		PlVar.phase = 0
		PlVar.messf = ""
		PlVar.dialo = 0
		PlVar.pause = 0
		if PlVar.scenario[8] == "1":
			PlVar.deblock = "11101"
		if PlVar.scenario[8] == "2":
			PlVar.deblock = "11111"
		PlVar.nextx = 0
		PlVar.nexty = 0
		Omni.goto_scene("res://Scenes/Maps/BossOne.tscn")
	if PlVar.phase == 1448:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 1450:
		Omni.goto_scene("res://Scenes/Maps/CacheBunker.tscn")
	pass


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_Timer_timeout():
	if PlVar.phase == 290 or PlVar.phase == 275 or PlVar.phase == 382 or PlVar.phase == 396 or PlVar.phase == 393 or PlVar.phase == 407 or PlVar.phase == 1449:
		PlVar.phase += 1
		pass
	pass
	pass # Replace with function body.


func _on_BOSSF_timeout():
	$CanvasLayer.bossf(1)
	pass # Replace with function body.


func _on_secret1_body_entered(body):
	if body.name == "player":
		sct = 1
	pass # Replace with function body.


func _on_secret2_body_entered(body):
	if body.name == "player":
		if sct == 1:
			sct = 2
		else:
			sct = 0
	pass # Replace with function body.


func _on_secret3_body_entered(body):
	if body.name == "player":
		if sct == 2:
			sct = 3
		else:
			sct = 0
	pass # Replace with function body.


func _on_secret4_body_entered(body):
	if body.name == "player":
		if sct == 3:
			sct = 4
		else:
			sct = 0
	pass # Replace with function body.


func _on_Remptimer_timeout():
	if remphase == 1:
		get_node("Node2D/PNJ/01Progfer1").set_visible(true)
		get_node("Node2D/PNJ/01Doubliks1").set_visible(true)
		var b = dialogb.instance()
		get_parent().add_child(b)
		if PlVar.phase == 245:
			get_node("Node2D/PNJ/03Tog1").set_visible(true)
		remphase = 2
		$Node2D/player/Black2.fondu(-0.01, 1)
	pass # Replace with function body.
