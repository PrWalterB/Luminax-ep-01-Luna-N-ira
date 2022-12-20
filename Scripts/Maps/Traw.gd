extends Node
var block = 0
var karma = 0
var mode = 0
var modo = 0
var gun3 = 0
var gun2 = 0
var gun4 = 0
var panpan = 0
var vel = Vector2()
var vell = Vector2()
var speed = 1
var cosmic = 1
var target
var targett
var turn
var tturn
var rand
var adia = 0
var curdia = 0
var vit = 1
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var proj = preload("res://Scenes/Projectiles/Mobs/enprojtraw.tscn")
var sol0 = preload("res://Scenes/Entities/soldier.tscn")
var sol1 = preload("res://Scenes/Entities/bigsoldier.tscn")
var sol2 = preload("res://Scenes/Entities/unit.tscn")
var p1 = preload("res://Scenes/Projectiles/Mobs/bossproj1.tscn")
var p2 = preload("res://Scenes/Entities/Poison.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
var sens = 1
var l1 = 1
var l2 = -1.5
var l3 = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.save_succ(18)
#	PlVar.scenario[18] = "0"
	target = $Node2D/player.global_position
	targett = $Node2D/player.global_position
	$Node2D/player.global_position = Vector2(1423, 1340)
	karma = int(PlVar.scenario[8]) + int(PlVar.scenario[14]) + (int(PlVar.scenario[17]) - 2)
#	karma = 5
	PlVar.map = 18
	PlVar.get_node("Musique").stream_paused = true
	if karma < 5:
		get_node("Node2D/0001135").name = "0001269"
	$Node2D/Olga/soldier.global_position = $Node2D/Olga/solposg.global_position
	$Node2D/Olga/soldier2.global_position = $Node2D/Olga/solposd.global_position
	turn = rand_range(0, 360)
	tturn = rand_range(0, 360)
	$Elec.start(0.1)
	$Smok.start(0.1)
	$Trembl.start(0.01)
	$Pics.start(0.01)
	$Poison.start(0.01)
	$Visee.start(0.0001)
	if PlVar.scenario[18] == "1":
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
		PlVar.map = 19
		$Node2D/PNJ.set_global_position(Vector2(1000,1000))
		get_node("CanvasLayer").bossf(5)
		if karma < 5:
			get_node("Node2D/0001269").queue_free()
		else:
			get_node("Node2D/0001135").queue_free()
		$Node2D/Traw/Bocal.playing = true
		$Node2D/Traw/center.playing = true
		$Node2D/Traw/Head.playing = true
		$Node2D/Traw/droite/side1.playing = true
		$Node2D/Traw/gauche/side1.playing = true
		$Node2D/Traw/droite/Arms/Arm1/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm2/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm3/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm4/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm1/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm2/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm3/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm4/armback/coude.playing = true
		PlVar.kelmus = 24
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		PlVar.bosslife = 2000*PlVar.diffpro
		PlVar.maxbosslife = 2000*PlVar.diffpro
#		PlVar.bosslife = 1*PlVar.diffpro
#		PlVar.maxbosslife = 1*PlVar.diffpro
		mode = 1
		$Bras.start(0.1)
		$Modes.start(5)
		$Node2D/Traw.z_index = 2
	if PlVar.scenario[18] == "2":
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
		modo = 1
		PlVar.bosslife = 2000*PlVar.diffpro
		PlVar.maxbosslife = 2000*PlVar.diffpro
		if karma < 5:
			get_node("Node2D/0001269").queue_free()
		else:
			get_node("Node2D/0001135").queue_free()
		PlVar.phase = 0
		PlVar.dialo = 0
		PlVar.get_node("Musique").stream_paused = false
		PlVar.map = 20
		PlVar.kelmus = 7
		PlVar.loop = 0
		PlVar.ambloop = 0
		$Node2D/PNJ.set_global_position(Vector2(1000,1000))
		get_node("CanvasLayer").bossaf = 0
		get_node("CanvasLayer").bossf(6)
		$Modos.start(5)
		$Node2D/Traw.set_visible(false)
		$Node2D/Olga.set_visible(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Node2D/Olga/Head/LASER1.look_at($Node2D/Olga/las1.global_position)
	$Node2D/Olga/Head/LASER2.look_at($Node2D/Olga/las2.global_position)
	$Node2D/Olga/Head/LASER3.look_at($Node2D/Olga/las3.global_position)
	if PlVar.map == 19:
		adia = int(float(float(1.0000 - float(float(PlVar.bosslife)/float(PlVar.maxbosslife))) * 2.0000) * 10.0000)
		if adia != curdia and adia < 20:
			PlVar.action(214 + adia)
			curdia = adia
	if PlVar.phase == 1221:
		PlVar.get_node("Musique").pitch_scale = 0.9
	if PlVar.phase == 1223:
		PlVar.get_node("Musique").pitch_scale = 0.8
	if PlVar.phase == 1225:
		PlVar.get_node("Musique").pitch_scale = 0.7
	if PlVar.phase == 1226:
		PlVar.get_node("Musique").pitch_scale = 0.6
	if PlVar.phase == 1227:
		PlVar.get_node("Musique").pitch_scale = 0.5
	if PlVar.phase >= 1259 and PlVar.phase <= 1261:
		$Node2D/player/Camera2D.shake(2,5,5)
	if PlVar.phase == 1251:
		get_node("Node2D/PNJ2/01Tog0").chara = "00Tog"
	if PlVar.phase == 1257:
		get_node("Node2D/PNJ2/01Tog0").chara = "01Tog"
	if PlVar.phase == 1262:
		$Node2D/BLACK.visible = true
	if PlVar.map == 22 and PlVar.phase < 1232:
		PlVar.phase = 1232
		var b = dialogb.instance()
		add_child(b)
		$Node2D/PNJ2.global_position = Vector2(0,0)
		$Node2D/Olga.z_index = 0
		$Node2D/Olga/soldier.global_position = $Node2D/Olga/solposg.global_position
		$Node2D/Olga/soldier2.global_position = $Node2D/Olga/solposd.global_position
		$Node2D/Olga/Head.animation = "dead"
		$Node2D/Olga/center.animation = "dead"
		$Node2D/Olga/Sides.animation = "dead"
		for i in $Node2D/Olga/gauche.get_children():
			i.get_node("coude").animation = "dead"
		for i in $Node2D/Olga/droite.get_children():
			i.get_node("coude").animation = "dead"
		$Node2D/player.global_position = Vector2(1440, 1003)
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.sens = 1
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
	if PlVar.map == 19:
		modo = 0
	if PlVar.map == 20:
		mode = 0
	if PlVar.phase == 1193:
		$Marche.start(0.01)
		if PlVar.sens == 1:
			var d = particule.instance()
			d.start(8, 0.5)
			d.global_position = get_node("Node2D/PNJ/01Doubliks0").global_position
			$Node2D.add_child(d)
			d = particule.instance()
			d.start(8, 0.5)
			d.global_position = get_node("Node2D/PNJ/01Tog0").global_position
			$Node2D.add_child(d)
			d = particule.instance()
			d.start(8, 0.5)
			d.global_position = get_node("Node2D/PNJ/01Progfer0").global_position
			$Node2D.add_child(d)
			d = particule.instance()
			d.start(8, 0.5)
			d.global_position = get_node("Node2D/player").global_position
			get_node("Node2D/PNJ/01Doubliks0").chara = "00Doubliks"
			get_node("Node2D/PNJ/01Progfer0").chara = "00Progfer"
			get_node("Node2D/PNJ/01Tog0").chara = "00Tog"
			PlVar.kelmus = 14
			PlVar.loop = 0
		PlVar.sens = 0
		
	if PlVar.bosslife < PlVar.maxbosslife - (PlVar.maxbosslife/200) and PlVar.map == 19 and karma >= 5:
		PlVar.dialo = 1
		mode = 5
		PlVar.map = 18
		PlVar.get_node("Musique").stream_paused = true
		PlVar.phase = 1178
		var b = dialogb.instance()
		add_child(b)
		$Node2D/Traw/Bocal.playing = false
		$Node2D/Traw/center.playing = false
		$Node2D/Traw/Head.frame = 0
		$Node2D/Traw/Head.playing = false
		$Node2D/Traw/droite/side1.playing = false
		$Node2D/Traw/gauche/side1.playing = false
		$Node2D/Traw/droite/Arms/Arm1/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm2/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm3/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm4/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm1/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm2/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm3/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm4/armback/coude.playing = false
		$Node2D/Traw.z_index = 2
	if PlVar.bosslife <= 0 and PlVar.map == 19 and karma < 5:
		var brycer = 0
		brycer = rand_range(1, 10)
		if int(brycer) == 5 and PlVar.difftog == 1:
			Omni.goto_scene("res://Scenes/Other/Bryce.tscn")
		PlVar.dialo = 1
		mode = 5
		PlVar.map = 23
		PlVar.phase = 1290
		$Node2D/Traw/Bocal.playing = false
		$Node2D/Traw/center.playing = false
		$Node2D/Traw/Head.frame = 0
		$Node2D/Traw/Head.playing = false
		$Node2D/Traw/droite/side1.playing = false
		$Node2D/Traw/gauche/side1.playing = false
		$Node2D/Traw/droite/Arms/Arm1/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm2/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm3/armback/coude.playing = false
		$Node2D/Traw/droite/Arms/Arm4/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm1/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm2/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm3/armback/coude.playing = false
		$Node2D/Traw/gauche/Arms/Arm4/armback/coude.playing = false
		$Node2D/Traw.z_index = 2
		PlVar.save_succ(19)
	if PlVar.bosslife <= 0 and PlVar.map == 20:
		var brycer = 0
		brycer = rand_range(1, 10)
		if int(brycer) == 5 and PlVar.difftog == 1:
			Omni.goto_scene("res://Scenes/Other/Bryce.tscn")
		$Node2D/player/Black2.fondu(0.01, 0, 1)
		PlVar.get_node("Musique").stream_paused = true
		$Node2D/Hurle.set_volume_db(PlVar.son + 30)
		$Node2D/Hurle.play()
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.map = 21
		PlVar.dialo = 1
		modo = 0
		mode = 0
		$Timer.start(10)
		PlVar.save_succ(20)
	if PlVar.phase == 1299:
		$ALERTALERTA.set_volume_db(PlVar.son + 30)
		if $ALERTALERTA.playing == false:
			$ALERTALERTA.play()
	if PlVar.phase == 1300:
		$ALERTALERTA.pitch_scale = 2
	if PlVar.phase == 1301:
		$ALERTALERTA.pitch_scale = 3
	if PlVar.phase == 1302:
		$ALERTALERTA.pitch_scale = 4
	if PlVar.phase == 1303:
		$ALERTALERTA.pitch_scale = 6
	if PlVar.phase == 1304:
		$ALERTALERTA.stream = load("res://Sons/acouphene.wav")
		$ALERTALERTA.play()
		$Node2D/BLACK.texture = load("res://Sprites/Cinematics/Begin/white.png")
		$Node2D/BLACK.visible = true
		PlVar.phase += 1
		$Timer.start(5)
	if mode != 5:
		$Node2D/screen.animation = "mod" + str(mode)
	else:
		$Node2D/screen.animation = "mod0"
	if PlVar.bosslife <= (PlVar.maxbosslife/4)*3 and (PlVar.map == 19 or PlVar.map == 23):
		$Node2D/player/Camera2D.shake(2,2*vit,2*vit)
	if PlVar.bosslife > PlVar.maxbosslife/4:
		vit = float(float(1) /float(float(PlVar.bosslife) / float(PlVar.maxbosslife)))
	if PlVar.dialo == 1 or PlVar.pause == 1:
		$Modes.paused = true
		$Modos.paused = true
		$Mitr.paused = true
		$Spawn.paused = true
		$Pics.paused = true
		$Poison.paused = true
		$Solturn.paused = true
		$Visee.paused = true
		speed = 0
	else:
		$Modes.paused = false
		$Modos.paused = false
		$Spawn.paused = false
		$Pics.paused = false
		$Poison.paused = false
		$Solturn.paused = false
		$Visee.paused = false
		if mode == 2 and gun2 == 1:
			$Mitr.paused = false
		if cosmic == 1:
			speed = 1*vit
		if cosmic == 0:
			speed = 0
	if PlVar.phase == 1262:
		PlVar.get_node("Musique").stream_paused = true
	if PlVar.phase == 1268 or PlVar.phase == 1306:
		Omni.goto_scene("res://Scenes/Other/Generique.tscn")
	if PlVar.phase == 1135 or PlVar.phase == 1179 or PlVar.phase == 1269 or PlVar.phase == 1290:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		PlVar.dialo = 1
		$Timer.start(3)
	if PlVar.phase == 1175 or PlVar.phase == 1229 or PlVar.phase == 1287:
		$Node2D/player/Black2.fondu(0.01, 0, 1)
		PlVar.get_node("Musique").stream_paused = true
		PlVar.phase += 1
		PlVar.dialo = 1
		$Timer.start(3)
	if PlVar.phase == 1137 or PlVar.phase == 1271:
		$Node2D/PNJ.set_global_position(Vector2(0,0))
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase += 1
		var b = dialogb.instance()
		add_child(b)
	if PlVar.phase == 1181 or PlVar.phase == 1292:
		$Node2D/PNJ.set_global_position(Vector2(0,0))
		if PlVar.phase == 1181:
			get_node("Node2D/PNJ/05Olga0").set_global_position(Vector2(1423, 1356))
		for i in get_node("Node2D").get_children():
			if "soldier" in i.name or "unit" in i.name:
				i.queue_free()
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase += 1
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.sens = 1
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.kelmus = 23
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		$Node2D/player.global_position = Vector2(1424,974)
		var b = dialogb.instance()
		add_child(b)
	if PlVar.phase == 1177 or PlVar.phase == 1289:
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
		PlVar.map = 19
		PlVar.scenario[18] = "1"
		PlVar.save_game()
		PlVar.kelmus = 24
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		PlVar.bosslife = 2000*PlVar.diffpro
		PlVar.maxbosslife = 2000*PlVar.diffpro
#		PlVar.bosslife = 1*PlVar.diffpro
#		PlVar.maxbosslife = 1*PlVar.diffpro
		PlVar.chargement = 1
		$Charge.start(3)
		$Node2D/PNJ.set_global_position(Vector2(1000,1000))
		get_node("CanvasLayer").bossf(5)
		if karma < 5:
			get_node("Node2D/0001269").queue_free()
		else:
			get_node("Node2D/0001135").queue_free()
		$Node2D/Traw/Bocal.playing = true
		$Node2D/Traw/center.playing = true
		$Node2D/Traw/Head.playing = true
		$Node2D/Traw/droite/side1.playing = true
		$Node2D/Traw/gauche/side1.playing = true
		$Node2D/Traw/droite/Arms/Arm1/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm2/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm3/armback/coude.playing = true
		$Node2D/Traw/droite/Arms/Arm4/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm1/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm2/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm3/armback/coude.playing = true
		$Node2D/Traw/gauche/Arms/Arm4/armback/coude.playing = true
		mode = 1
		$Bras.start(0.01)
		$Modes.start(5)
		$Node2D/Traw.z_index = 2
	if PlVar.phase == 1231:
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
		PlVar.map = 20
		PlVar.get_node("Musique").stream_paused = false
		PlVar.ambloop = 0
		PlVar.scenario[18] = "2"
		PlVar.save_game()
		PlVar.bosslife = 2000*PlVar.diffpro
		PlVar.maxbosslife = 2000*PlVar.diffpro
		PlVar.kelmus = 7
		PlVar.loop = 0
		PlVar.get_node("Musique").stream_paused = false
		modo = 1
		PlVar.chargement = 1
		$Charge.start(3)
		$Node2D/PNJ.set_global_position(Vector2(1000,1000))
		get_node("CanvasLayer").bossaf = 0
		get_node("CanvasLayer").bossf(6)
		$Modos.start(5)
		$Node2D/Traw.set_visible(false)
		$Node2D/Olga.set_visible(true)
	if PlVar.phase == 1147 and PlVar.kelmus != 23:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 23
		PlVar.loop = 0
	if PlVar.phase == 1163 and PlVar.kelmus != 22:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 22
		PlVar.keltraw = 0
		PlVar.loop = 0
	if PlVar.phase == 1168 and block == 0:
		$Node2D/player/Camera2D.shake(2,10,10)
		block += 1
		PlVar.keltraw = 1
		PlVar.loop = 0
	if PlVar.phase == 1169 and block == 1:
		$Node2D/player/Camera2D.shake(2,15,15)
		$Bras.start(0.01)
		block +=1
		PlVar.keltraw = 2
		PlVar.loop = 0
	if PlVar.phase == 1170 and block == 2:
		$Node2D/player/Camera2D.shake(2,20,20)
		block +=1
		PlVar.keltraw = 3
		PlVar.loop = 0
	if PlVar.phase == 1171 and block == 3:
		$Node2D/player/Camera2D.shake(2,25,25)
		block +=1
		PlVar.keltraw = 4
		PlVar.loop = 0
	if PlVar.phase == 1172 and block == 4:
		$Node2D/player/Camera2D.shake(2,25,25)
		block +=1
		PlVar.keltraw = 5
		PlVar.loop = 0
	if PlVar.phase == 1173 and block == 5:
		$Node2D/player/Camera2D.shake(2,30,30)
		block +=1
		PlVar.keltraw = 6
		PlVar.loop = 0
	vel = (target - $Node2D/Olga/soldier.global_position).normalized() * speed
	vell = (targett - $Node2D/Olga/soldier2.global_position).normalized() * speed
	$Node2D/Olga/soldier.rotation_degrees = turn
	$Node2D/Olga/soldier2.rotation_degrees = tturn
	if PlVar.map != 22:
		if modo == 3:
			target = $Node2D/player.global_position
			targett = target
			$Node2D/Olga/soldier.move_and_collide(vel)
			$Node2D/Olga/soldier2.move_and_collide(vell)
		else:
			target = $Node2D/Olga/solposg.global_position
			targett = $Node2D/Olga/solposd.global_position
			$Node2D/Olga/soldier.move_and_collide(vel)
			$Node2D/Olga/soldier2.move_and_collide(vell)
		if modo == 2:
			$Node2D/Olga/Sides.set_animation("open")
			$Node2D/Olga/Head/LASER1.visible = true
			$Node2D/Olga/Head/LASER2.visible = true
			$Node2D/Olga/Head/LASER3.visible = true
			$Node2D/Olga/Head/LASER1/MEGALASER/CollisionPolygon2D.disabled = false
			$Node2D/Olga/Head/LASER2/MEGALASER/CollisionPolygon2D.disabled = false
			$Node2D/Olga/Head/LASER3/MEGALASER/CollisionPolygon2D.disabled = false
		else:
			$Node2D/Olga/Sides.set_animation("default")
			$Node2D/Olga/Head/LASER1.visible = false
			$Node2D/Olga/Head/LASER2.visible = false
			$Node2D/Olga/Head/LASER3.visible = false
			$Node2D/Olga/Head/LASER1/MEGALASER/CollisionPolygon2D.disabled = true
			$Node2D/Olga/Head/LASER2/MEGALASER/CollisionPolygon2D.disabled = true
			$Node2D/Olga/Head/LASER3/MEGALASER/CollisionPolygon2D.disabled = true
	if mode == 4:
		if gun4 == 0:
			$Spawn.start(0.01)
			gun4 = 1
	else:
		gun4 = 0
	if mode == 3:
		if gun3 == 1:
			$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun.look_at($Node2D/Traw/visee.global_position)
			$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun.look_at($Node2D/Traw/visee.global_position)
			$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun/LASER.visible = true
			$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun/LASER/MEGALASER/CollisionPolygon2D.disabled = false
			$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun/LASER.visible = true
			$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun/LASER/MEGALASER/CollisionPolygon2D.disabled = false
	else:
		$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun/LASER.visible = false
		$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun/LASER/MEGALASER/CollisionPolygon2D.disabled = true
		$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun/LASER.visible = false
		$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun/LASER/MEGALASER/CollisionPolygon2D.disabled = true
	if mode == 2:
		if gun2 == 1:
			$Node2D/Traw/droite/Arms/Arm3/armback/armfront/gun.look_at($Node2D/player.global_position)
			$Node2D/Traw/gauche/Arms/Arm3/armback/armfront/gun.look_at($Node2D/player.global_position)
	if mode == 1:
		$Node2D/Traw/Head.playing = false
		$Node2D/Traw/Head.frame = 0
		$Node2D/Traw/gauche/Arms/Arm4/armback/armfront/gun/soldier/CollisionPolygon2D.disabled = false
		$Node2D/Traw/droite/Arms/Arm4/armback/armfront/gun/soldier/CollisionPolygon2D.disabled = false
	elif mode != 0:
		$Node2D/charge.visible = false
		if mode != 5:
			$Node2D/Traw/Head.playing = true
	if mode != 1:
		$Node2D/Traw/gauche/Arms/Arm4/armback/armfront/gun/soldier/CollisionPolygon2D.disabled = true
		$Node2D/Traw/droite/Arms/Arm4/armback/armfront/gun/soldier/CollisionPolygon2D.disabled = true

	pass


func _on_Timer_timeout():
	if PlVar.phase == 1136 or PlVar.phase == 1176 or PlVar.phase == 1180 or PlVar.phase == 1230 or PlVar.phase == 1270 or PlVar.phase == 1288 or PlVar.phase == 1291:
		PlVar.phase += 1
		PlVar.get_node("Musique").pitch_scale = 1
	if PlVar.map == 21:
		PlVar.get_node("Musique").stream_paused = false
		PlVar.map = 22
		PlVar.kelmus = 13
		PlVar.loop = 0
		PlVar.ambloop = 0
	if PlVar.phase == 1305:
		PlVar.phase += 1
	pass # Replace with function body.


func _on_Bras_timeout():
	if mode == 0:
		if PlVar.phase >= 1169 and $Node2D/Traw/droite/Arms/Arm4.rotation_degrees > -50 and $Node2D/Traw/gauche/Arms/Arm4.rotation_degrees > -50:
			$Node2D/Traw/droite/Arms/Arm4.rotation_degrees -= 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm4.rotation_degrees -= 1*PlVar.uldelta
		if PlVar.phase >= 1170 and $Node2D/Traw/droite/Arms/Arm3.rotation_degrees > -40 and $Node2D/Traw/gauche/Arms/Arm3.rotation_degrees > -40:
			$Node2D/Traw/droite/Arms/Arm3.rotation_degrees -= 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm3.rotation_degrees -= 1*PlVar.uldelta
		if PlVar.phase >= 1171 and $Node2D/Traw/droite/Arms/Arm2.rotation_degrees > 10 and $Node2D/Traw/gauche/Arms/Arm2.rotation_degrees > 10:
			$Node2D/Traw/droite/Arms/Arm2.rotation_degrees -= 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm2.rotation_degrees -= 1*PlVar.uldelta
		if PlVar.phase >= 1172 and $Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees < 40 and $Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees < 40:
			$Node2D/Traw/droite/Arms/Arm2/armback/armfront.rotation_degrees += 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm2/armback/armfront.rotation_degrees += 1*PlVar.uldelta
			$Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees += 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees += 1*PlVar.uldelta
		if PlVar.phase >= 1173 and $Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees < 10 and $Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees < 10:
			$Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees += 1*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees += 1*PlVar.uldelta
	if mode == 1:
		if $Node2D/Traw/droite/Arms/Arm4.rotation_degrees > -50 and $Node2D/Traw/gauche/Arms/Arm4.rotation_degrees > -50:
			$Node2D/Traw/droite/Arms/Arm4.rotation_degrees -= vit*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm4.rotation_degrees -= vit*PlVar.uldelta
		else:
			if $Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees < 10 and $Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees < 10:
				$Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees += vit*PlVar.uldelta
				$Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees += vit*PlVar.uldelta
			else:
				$Node2D/charge.visible = true
	if mode == 2:
		if $Node2D/Traw/droite/Arms/Arm3.rotation_degrees > -110 and $Node2D/Traw/gauche/Arms/Arm3.rotation_degrees > -110:
			$Node2D/Traw/droite/Arms/Arm3.rotation_degrees -= vit*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm3.rotation_degrees -= vit*PlVar.uldelta
		else:
			if $Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees < 75 and $Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees < 75:
				$Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees += vit*PlVar.uldelta
				$Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees += vit*PlVar.uldelta
			else:
				if gun2 != 1:
					$Mitr.start(0.1)
					gun2 = 1
	if mode == 3:
		if $Node2D/Traw/droite/Arms/Arm2.rotation_degrees > -25 and $Node2D/Traw/gauche/Arms/Arm2.rotation_degrees > -25:
			$Node2D/Traw/droite/Arms/Arm2.rotation_degrees -= vit*PlVar.uldelta
			$Node2D/Traw/gauche/Arms/Arm2.rotation_degrees -= vit*PlVar.uldelta
		else:
			if $Node2D/Traw/droite/Arms/Arm2/armback/armfront.rotation_degrees < 57.7 and $Node2D/Traw/gauche/Arms/Arm2/armback/armfront.rotation_degrees < 57.7:
				$Node2D/Traw/droite/Arms/Arm2/armback/armfront.rotation_degrees += vit*PlVar.uldelta
				$Node2D/Traw/gauche/Arms/Arm2/armback/armfront.rotation_degrees += vit*PlVar.uldelta
			else:
				gun3 = 1
	if mode != 0:
		if mode != 1:
			if $Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees > -108.8 and $Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees > -108.8:
					$Node2D/Traw/droite/Arms/Arm4/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
					$Node2D/Traw/gauche/Arms/Arm4/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
			else:
				if $Node2D/Traw/droite/Arms/Arm4.rotation_degrees < 36.6 and $Node2D/Traw/gauche/Arms/Arm4.rotation_degrees < 36.6:
					$Node2D/Traw/droite/Arms/Arm4.rotation_degrees += vit*PlVar.uldelta
					$Node2D/Traw/gauche/Arms/Arm4.rotation_degrees += vit*PlVar.uldelta
		if mode != 2:
			if $Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees > -63 and $Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees > -63:
				$Node2D/Traw/droite/Arms/Arm3/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
				$Node2D/Traw/gauche/Arms/Arm3/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
			else:
				if $Node2D/Traw/droite/Arms/Arm3.rotation_degrees < 9.7 and $Node2D/Traw/gauche/Arms/Arm3.rotation_degrees < 9.7:
					$Node2D/Traw/droite/Arms/Arm3.rotation_degrees += vit*PlVar.uldelta
					$Node2D/Traw/gauche/Arms/Arm3.rotation_degrees += vit*PlVar.uldelta
				else:
					gun2 = 0
					$Node2D/Traw/droite/Arms/Arm3/armback/armfront/gun.rotation_degrees = 90
					$Node2D/Traw/gauche/Arms/Arm3/armback/armfront/gun.rotation_degrees = 90
		if mode != 3:
			if $Node2D/Traw/droite/Arms/Arm2/armback/armfront.rotation_degrees > -63 and $Node2D/Traw/gauche/Arms/Arm2/armback/armfront.rotation_degrees > -63:
				$Node2D/Traw/droite/Arms/Arm2/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
				$Node2D/Traw/gauche/Arms/Arm2/armback/armfront.rotation_degrees -= vit*PlVar.uldelta
			else:
				if $Node2D/Traw/droite/Arms/Arm2.rotation_degrees < 49.4 and $Node2D/Traw/gauche/Arms/Arm2.rotation_degrees < 49.4:
					$Node2D/Traw/droite/Arms/Arm2.rotation_degrees += vit*PlVar.uldelta
					$Node2D/Traw/gauche/Arms/Arm2.rotation_degrees += vit*PlVar.uldelta
				else:
					gun3 = 0
					$Node2D/Traw/droite/Arms/Arm2/armback/armfront/gun.rotation_degrees = 90
					$Node2D/Traw/gauche/Arms/Arm2/armback/armfront/gun.rotation_degrees = 90
	
	$Bras.start(0.01)
	pass # Replace with function body.


func _on_Modes_timeout():
	if mode < 4:
		mode += 1
	else:
		mode = 1
	$Modes.start(((5*mode) + 5)/vit)
	pass # Replace with function body.


func _on_Mitr_timeout():
	if mode == 2 and gun2 == 1:
		var b = proj.instance()
		b.global_position = get_node("Node2D/Traw/gauche/Arms/Arm3/armback/armfront/pos" + str(panpan)).global_position
		add_child(b)
		var c = proj.instance()
		c.global_position = get_node("Node2D/Traw/droite/Arms/Arm3/armback/armfront/pos" + str(panpan)).global_position
		add_child(c)
		if panpan < 4:
			panpan += 1
		else:
			panpan = 1
		$Mitr.start(0.1/vit)
	pass # Replace with function body.


func _on_MEGALASER_body_entered(body):
	if "player" in body.name:
		body.hit(rand_range(10, 15))
	pass # Replace with function body.


func _on_Spawn_timeout():
	if mode == 4:
		$Node2D/solpos.global_position.x = rand_range(1324, 1527)
		$Node2D/solpos.global_position.y = rand_range(1018, 1199)
		rand = rand_range(0, 1)
		var a
		if rand <= 0.89:
			a = sol0.instance()
		elif rand > 0.89 and rand <= 0.945:
			a = sol1.instance()
		else:
			a = sol2.instance()
		a.global_position = $Node2D/solpos.global_position
		$Node2D.add_child(a)
		var b = particule.instance()
		b.global_position = $Node2D/solpos.global_position
		b.start(14, 1)
		$Node2D.add_child(b)
		$Spawn.start(5/(vit*PlVar.uldelta))
	pass # Replace with function body.


func _on_Elec_timeout():
	if PlVar.bosslife <= (PlVar.maxbosslife/4)*3 and (PlVar.map == 19 or PlVar.map == 22 or PlVar.map == 23):
		$Node2D/elecpos.global_position.x = rand_range(1346, 1505)
		$Node2D/elecpos.global_position.y = rand_range(811, 905)
		var b = particule.instance()
		b.global_position = $Node2D/elecpos.global_position
		b.start(18, rand_range(0.5, 1))
		$Node2D.add_child(b)
	$Elec.start(rand_range(1, 5) / float(vit))
		
	pass # Replace with function body.


func _on_Smok_timeout():
	if PlVar.bosslife <= (PlVar.maxbosslife/4)*3 and (PlVar.map == 19 or PlVar.map == 23):
		$Node2D/smokpos.global_position.x = rand_range(1367, 1488)
		var c = particule.instance()
		c.global_position = $Node2D/smokpos.global_position
		c.start(19, 30)
		$Node2D.add_child(c)
	$Smok.start(rand_range(0.3, 1) / float(vit*PlVar.uldelta))
	pass # Replace with function body.


func _on_Marche_timeout():
	if PlVar.phase >= 1193 and get_node("Node2D/PNJ/05Olga0").global_position.y > 1050:
		get_node("Node2D/PNJ/05Olga0").global_position.y -= 1*PlVar.uldelta
	if get_node("Node2D/PNJ/05Olga0").global_position.y <= 1050:
		get_node("Node2D/PNJ/05Olga0").chara = "01Olga"
	$Marche.start(0.01)
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_Trembl_timeout():
	if PlVar.map == 20:
		$Node2D/Olga/Head.rotation_degrees += rand_range(-vit, vit)*PlVar.uldelta
		for i in $Node2D/Olga/gauche.get_children():
			i.rotation_degrees += rand_range(-vit*0.1, vit*0.1)*PlVar.uldelta
			i.get_node("coude").rotation_degrees += rand_range(-vit, vit)*PlVar.uldelta
		for i in $Node2D/Olga/droite.get_children():
			i.rotation_degrees += rand_range(-vit*0.1, vit*0.1)*PlVar.uldelta
			i.get_node("coude").rotation_degrees += rand_range(-vit, vit)*PlVar.uldelta
	$Trembl.start(0.01)
	pass # Replace with function body.


func _on_Pics_timeout():
	if modo == 1:
		var b = p1.instance()
		b.global_position = Vector2(rand_range(1237, 1608), rand_range(1036, 1291))
		get_parent().add_child(b)
		var c = p1.instance()
		c.global_position = $Node2D/player.global_position
		get_parent().add_child(c)
		var a = p1.instance()
		a.global_position = Vector2(rand_range(1237, 1608), rand_range(1036, 1291))
		get_parent().add_child(a)
		var d = p1.instance()
		d.global_position = $Node2D/player.global_position
		get_parent().add_child(d)
	$Pics.start(1/vit)
	pass # Replace with function body.


func _on_Modos_timeout():
	modo = int(rand_range(1, 3.9))
	$Modos.start(rand_range(2, 10)*PlVar.uldelta)
	pass # Replace with function body.


func _on_Poison_timeout():
	if modo == 2:
		var b = p2.instance()
		b.global_position = Vector2(rand_range(1346, 1367), rand_range(841, 898))
		get_parent().add_child(b)
		var c = p2.instance()
		c.global_position = Vector2(rand_range(1467, 1500), rand_range(830, 905))
		get_parent().add_child(c)
	$Poison.start(1.5)
	pass # Replace with function body.


func _on_Solturn_timeout():
	turn += 10*PlVar.uldelta
	tturn += 10*PlVar.uldelta
	$Solturn.start(0.01)
	pass # Replace with function body.


func _on_Visee_timeout():
	if $Node2D/Olga/las1.position.x <= -220:
		l1 = 1.00*vit*PlVar.uldelta
	elif $Node2D/Olga/las1.position.x >= 220:
		l1 = -1.00*vit*PlVar.uldelta
	if $Node2D/Olga/las2.position.x <= -220:
		l2 = 1.5*vit*PlVar.uldelta
	elif $Node2D/Olga/las2.position.x >= 220:
		l2 = -1.5*vit*PlVar.uldelta
	if $Node2D/Olga/las3.position.x <= -220:
		l3 = 0.5*vit*PlVar.uldelta
	elif $Node2D/Olga/las3.position.x >= 220:
		l3 = -0.5*vit*PlVar.uldelta
	if l1 != null:
		$Node2D/Olga/las1.position.x += l1*PlVar.uldelta
	if l2 != null:
		$Node2D/Olga/las2.position.x += l2*PlVar.uldelta
	if l3 != null:
		$Node2D/Olga/las3.position.x += l3*PlVar.uldelta
		
	if $Node2D/Traw/visee.position.y <= 137:
		sens = 1.00*vit*PlVar.uldelta
	elif $Node2D/Traw/visee.position.y >= 550:
		sens = -1.00*vit*PlVar.uldelta
	if sens != null:
		$Node2D/Traw/visee.position.y += sens*PlVar.uldelta
		$Node2D/Traw/visee.global_position.x = $Node2D/player.global_position.x
	$Visee.start(0.001)
	pass # Replace with function body.


func _on_ALERTALERTA_finished():
	if PlVar.phase >= 1299:
		$ALERTALERTA.play()
	pass # Replace with function body.
