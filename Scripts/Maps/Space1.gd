extends Node2D
# warning-ignore:unused_class_variable
var ascend = 0
# warning-ignore:unused_class_variable
var sky = 0
# warning-ignore:unused_class_variable
var pos = 0
var freq = 0
var freqw = 0
var freqs = 0
var typvais = 1
var scin = 1
var ecoul = 0
var bossend = 0
#Type, Position X, Position Y, Vitesse, Scale
var spaceobj = [["null", 0, 0, 0, 0]]
var dials = [[0,0],[71,73],[74,90],[91,93],[94,96],[97,144],[145,166],[167,194]]
var seldial = 0
var currdial = 0
#Type, Vitesse
var turnobj = [["null", 0]]
var ast = preload("res://Scenes/Entities/Asteroide.tscn")
var wasp = preload("res://Scenes/Entities/waspsoldier.tscn")
var bsol = preload("res://Scenes/Entities/bigsoldierspace.tscn")
var cauch = preload("res://Scenes/Entities/NightmareSoldier.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#PlVar.phase = -33
	#PlVar.scenario[14] = "1"
	$SCIN.start(0.25)
	$player.position.x = 81
	$player.position.y = 183
	PlVar.map = 3
	PlVar.kelmus = 4
	PlVar.loop = 0
	$Timer.start(0.001)
	if PlVar.phase != -4 or PlVar.phase != -14 or PlVar.phase != -24:
		PlVar.pause = 0
		PlVar.mort = 0
	if PlVar.phase == -3:
		typvais = 0
		PlVar.phase = -4
		freq = 1
		spaceobj = [["Luminax", 1800, 184, -1, 1]]
		$Timer2.start(30)
	if PlVar.phase == -13:
		typvais = 0
		PlVar.phase = -14
		freq = 0.7
		seldial = 1
		spaceobj = [["Luminax", 50, 164, -1, 0.8], ["Vulav", 6500, 200, -2, 0.3]]
		$Timer2.start(60)
	if PlVar.phase == -23:
		typvais = 1
		PlVar.phase = -24
		freq = 0.8
		freqw = 20
		turnobj = [["Belt", -0.03]]
		$Timer2.start(60)
	if PlVar.phase == -33:
		PlVar.save_succ(8)
		typvais = 1
		freq = 4
		freqw = 10
		freqs = 8
		if PlVar.scenario[14] == "2":
			seldial = 2
			$Timer2.start(121)
			turnobj = [["VulavFront", -0.1]]
		else:
			seldial = 6
			$Timer2.start(90)
#		$Timer2.start(5)
	if typvais == 0:
		PlVar.perso = -100
	if typvais == 1:
		PlVar.perso = -101
	if freq != 0:
		$Timer3.start(freq)
	if freqw != 0:
		$Timer4.start(freqw)
	if freqs != 0:
		$Timer5.start(freqs)
	for i in spaceobj:
		get_node("ObjetsSpatiaux/"+ i[0]).position = Vector2(i[1], i[2])
		get_node("ObjetsSpatiaux/"+ i[0]).scale = Vector2(i[4], i[4])
	for i in turnobj:
		get_node("ObjetsSpatiaux/"+i[0]).set_visible(true)
	$SPACEOBJ.start(0.01)
	if seldial != 0:
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		$DIALOS.start(PlVar.vitphac + 0.1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phaction == 118 and $Ol.animation == "default":
		$Vaisseaux.visible = true
		PlVar.kelmus = 14
		PlVar.loop = 0
		$Ol.play("app")
	if PlVar.phaction == 135 and $Ol.animation == "0":
		PlVar.kelmus = 17
		PlVar.loop = 0
		$Ol.play("dapp")
	if PlVar.phaction >= 119 and PlVar.phaction <= 134:
		if PlVar.chara == 8:
			$Ol.set_animation(str(PlVar.pp))
		else:
			$Ol.set_animation("0")
	if bossend == 1:
		PlVar.phase = -36
		$BOSSEND.start(12)
		freqw = 0
		bossend = 2
	if (PlVar.phase == -35 and (PlVar.bosslife <= 205*PlVar.diffpro and PlVar.maxbosslife == 400*PlVar.diffpro)) and seldial == 3:
		seldial = 4
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		$DIALOS.start(PlVar.vitphac + 0.1)
	if freq == 0:
		$Timer3.set_paused(true)
	if freqw == 0:
		$Timer4.set_paused(true)
	if freqs == 0:
		$Timer5.set_paused(true)
	PlVar.zoom = 0.7
	if PlVar.pause != 0:
		$Timer2.set_paused(true)
	else:
		$Timer2.set_paused(false)
	if $Fond.position.x <= -886:
		$Fond.position.x = 648
	if $Fond2.position.x <= -886:
		$Fond2.position.x = 648
	if $Fond3.position.x <= -886:
		$Fond3.position.x = 648
	$PosAst.global_position.y = rand_range(-122, 512)
	$PosWasp.global_position.y = rand_range(60, 226)
	$PosSol.global_position.x = rand_range(-107, 194)
	pass


func _on_Timer_timeout():
	if PlVar.pause == 0:
		$Fond.position.x -= 1*PlVar.uldelta
		$Fond2.position.x -= 1*PlVar.uldelta
		$Fond3.position.x -= 1*PlVar.uldelta
	$Timer.start(0.001)
	pass # Replace with function body.


func _on_Timer2_timeout():
	if PlVar.phase == -33 and PlVar.scenario[14] == "2":
		var b = cauch.instance()
		b.global_position = $Cauchemar.global_position
		PlVar.kelmus = 16
		PlVar.loop = 0
		add_child(b)
		PlVar.bosslife = 400*PlVar.diffpro
#		PlVar.bosslife = 1
		PlVar.maxbosslife = 400*PlVar.diffpro
		$CanvasLayer.bossf(2)
		$NightmareSoldier/GO.start(0.01)
		freq = 0
		freqw = 20
		freqs = 0
		seldial = 3
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		$DIALOS.start(PlVar.vitphac + 0.1)
		PlVar.phase = -35
		turnobj = [["VulavFront", -0.01]]
		$Timer2.stop()
		pass
	elif PlVar.phase == -38:
		$Vaisseaux.mode = 0
		seldial = 7
		PlVar.kelmus = 18
		PlVar.loop = 0
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		PlVar.phase = -39
		$chloro/VaisseauChloro.move = 1
		$chloro/VaisseauChloro2.move = 1
		$chloro/VaisseauChloro3.move = 1
		$CHLORO.start(10)
		
	else:
		if PlVar.phase == -3:
			PlVar.phase = -4
		if PlVar.phase == -13:
			PlVar.phase = -14
		if PlVar.phase == -23:
			PlVar.phase = -24
		if PlVar.phase == -37 or PlVar.phase == -33:
			PlVar.phase = -34
		Omni.goto_scene("res://Scenes/Maps/Clouds.tscn")
	pass # Replace with function body.


func _on_Timer3_timeout():
	if PlVar.pause == 0:
		var b = ast.instance()
		b.global_position = $PosAst.global_position
		get_parent().add_child(b)
	$Timer3.start(freq*PlVar.uldelta)
	pass # Replace with function body.


func _on_Timer4_timeout():
	if PlVar.pause == 0:
		var b = wasp.instance()
		b.global_position = $PosWasp.global_position
		add_child(b)
	$Timer4.start(freqw*PlVar.uldelta)
	pass # Replace with function body.


func _on_Timer5_timeout():
	if PlVar.pause == 0:
		var b = bsol.instance()
		b.global_position = $PosSol.global_position
		add_child(b)
	$Timer5.start(freqw*PlVar.uldelta)
	pass # Replace with function body.


func _on_SCIN_timeout():
	if scin <= 0.4:
		ecoul = 1
	if scin >= 1:
		ecoul = 0
	if ecoul == 0:
		scin -= 0.2*PlVar.uldelta
		$ObjetsSpatiaux/Luminax.set_modulate(Color(1, 1, 1, scin))
	if ecoul == 1:
		scin += 0.2*PlVar.uldelta
		$ObjetsSpatiaux/Luminax.set_modulate(Color(1, 1, 1, scin))
	pass # Replace with function body.


func _on_SPACEOBJ_timeout():
	for i in spaceobj:
		get_node("ObjetsSpatiaux/"+ i[0]).position.x += i[3]*PlVar.uldelta
		$SPACEOBJ.start(0.01)
	for i in turnobj:
		get_node("ObjetsSpatiaux/"+i[0]).rotation_degrees += i[1]*PlVar.uldelta
	pass # Replace with function body.


func _on_DIALOS_timeout():
	if currdial < dials[seldial][1] and PlVar.phase != -38:
		currdial += 1
		PlVar.action(currdial)
		$DIALOS.start((PlVar.vitphac + 0.1)*PlVar.uldelta)
	else:
		if seldial == 5 and $Vaisseaux.mode == 0:
			$Vaisseaux.mode = 1
			PlVar.phase = -38
			$Timer2.start(120)
		if seldial == 7:
			get_node("player/Black2").fondu(0.01, 0)
			seldial = 6
			PlVar.phase = -37
			$Timer2.start(3)
	pass # Replace with function body.


func _on_BOSSEND_timeout():
	if seldial !=5 and PlVar.phase > -37:
		freq = 4
		seldial = 5
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.kelmus = 6
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		$DIALOS.start((PlVar.vitphac + 0.1)*PlVar.uldelta)
		$ObjetsSpatiaux/VulavFront.set_visible(false)
		get_node("player/Black2").fondu(-0.005, 1, 1)
	pass # Replace with function body.


func _on_Ol_animation_finished():
	if $Ol.animation == "app":
		$Ol.animation = "1529"
	if $Ol.animation == "dapp":
		$Ol.animation = "default"
	pass # Replace with function body.


func _on_CHLORO_timeout():
	$chloro/VaisseauChloro.move = 0
	$chloro/VaisseauChloro2.move = 0
	$chloro/VaisseauChloro3.move = 0
	pass # Replace with function body.
