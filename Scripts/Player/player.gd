#Initialisation
extends KinematicBody2D
var vel = Vector2()
var target = Vector2()
var speed = 100
var life = 100
var vieaff = ""
var defense = 1
var sens = 0
export var perso = 0
var isatt = 0
var mov = 0
var isatt01 = 0
var isatt02 = 0
var isatt03 = 0
var isatt04 = 0
var isatt05 = 0
# warning-ignore:unused_class_variable
var isatt06 = 0
# warning-ignore:unused_class_variable
var isatt07 = 0
# warning-ignore:unused_class_variable
var isatt08 = 0
# warning-ignore:unused_class_variable
var clock = 0
var dam = 0
var retoorn = 0
var pause = 0
var trans = 0
var nbsig = 0
var sah = 0
var protection = 0
var tirvai = 0
var soul = 1
var transoul = 0
var cpierre = 0
var fusion = 0

#Variables de chemin
# warning-ignore:unused_class_variable
var chProj = "res://Scenes/Projectiles/Characters/"

#Preload des projectiles
var vatt01 = preload("res://Scenes/Projectiles/Characters/projveg1.tscn")
var vatt03 = preload("res://Scenes/Projectiles/Characters/protveg3.tscn")
var vatt04 = preload("res://Scenes/Projectiles/Characters/projveg4.tscn")
var patt01 = preload("res://Scenes/Projectiles/Characters/projprog1.tscn")
var patt03 = preload("res://Scenes/Projectiles/Characters/projprog3.tscn")
var patt04 = preload("res://Scenes/Projectiles/Characters/projprog4.tscn")
var datt01 = preload("res://Scenes/Projectiles/Characters/projdoub1.tscn")
var datt02 = preload("res://Scenes/Projectiles/Characters/prodoub2.tscn")
var datt03 = preload("res://Scenes/Projectiles/Characters/projdoub3.tscn")
var datt04 = preload("res://Scenes/Projectiles/Characters/projdoub4.tscn")
var tatt01 = preload("res://Scenes/Projectiles/Characters/projtog1.tscn")
var tatt02 = preload("res://Scenes/Projectiles/Characters/protog2.tscn")
var tatt03 = preload("res://Scenes/Projectiles/Characters/projtog3.tscn")
var tatt04 = preload("res://Scenes/Projectiles/Characters/projtog4.tscn")
var vaitt01 = preload("res://Scenes/Projectiles/Characters/projvai1.tscn")
var vaitt02 = preload("res://Scenes/Projectiles/Characters/projvai2.tscn")
var vaitt03 = preload("res://Scenes/Projectiles/Characters/projvai3.tscn")
var part = preload("res://Scenes/Other/particle.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")

#Preload des sprites
# warning-ignore:unused_class_variable
var vaiguit = preload("res://Sprites/GUI/Bars/barship.png")
#VEGET
var vguit = preload("res://Sprites/GUI/Bars/barv.png")
var vattg01 = preload("res://Sprites/GUI/Att/attv1.png")
var vattg02 = preload("res://Sprites/GUI/Att/attv2.png")
var vattg03 = preload("res://Sprites/GUI/Att/attv3.png")
var vattg04 = preload("res://Sprites/GUI/Att/attv4.png")
var vattg05 = preload("res://Sprites/GUI/Att/attv5.png")
var vat0g01 = preload("res://Sprites/GUI/Att/attv1none.png")
var vat0g02 = preload("res://Sprites/GUI/Att/attv2none.png")
var vat0g03 = preload("res://Sprites/GUI/Att/attv3none.png")
var vat0g04 = preload("res://Sprites/GUI/Att/attv4none.png")
var vat0g05 = preload("res://Sprites/GUI/Att/attv5none.png")
var voui01 = preload("res://Sprites/GUI/Att/ouiv.png")
#PROGFER
var pguit = preload("res://Sprites/GUI/Bars/barp.png")
var pattg01 = preload("res://Sprites/GUI/Att/attp1.png")
var pattg02 = preload("res://Sprites/GUI/Att/attp2.png")
var pattg03 = preload("res://Sprites/GUI/Att/attp3.png")
var pattg04 = preload("res://Sprites/GUI/Att/attp4.png")
var pattg05 = preload("res://Sprites/GUI/Att/attp5.png")
var pat0g01 = preload("res://Sprites/GUI/Att/attp1none.png")
var pat0g02 = preload("res://Sprites/GUI/Att/attp2none.png")
var pat0g03 = preload("res://Sprites/GUI/Att/attp3none.png")
var pat0g04 = preload("res://Sprites/GUI/Att/attp4none.png")
var pat0g05 = preload("res://Sprites/GUI/Att/attp5none.png")
var poui01 = preload("res://Sprites/GUI/Att/ouip.png")
#DOUBLIKS
var dguit = preload("res://Sprites/GUI/Bars/bard.png")
var dattg01 = preload("res://Sprites/GUI/Att/attd1.png")
var dattg02 = preload("res://Sprites/GUI/Att/attd2.png")
var dattg03 = preload("res://Sprites/GUI/Att/attd3.png")
var dattg04 = preload("res://Sprites/GUI/Att/attd4.png")
var dattg05 = preload("res://Sprites/GUI/Att/attd5.png")
var dat0g01 = preload("res://Sprites/GUI/Att/attd1none.png")
var dat0g02 = preload("res://Sprites/GUI/Att/attd2none.png")
var dat0g03 = preload("res://Sprites/GUI/Att/attd3none.png")
var dat0g04 = preload("res://Sprites/GUI/Att/attd4none.png")
var dat0g05 = preload("res://Sprites/GUI/Att/attd5none.png")
var doui01 = preload("res://Sprites/GUI/Att/ouid.png")
#TOG
var tguit = preload("res://Sprites/GUI/Bars/bart.png")
var tattg01 = preload("res://Sprites/GUI/Att/attt1.png")
var tattg02 = preload("res://Sprites/GUI/Att/attt2.png")
var tattg03 = preload("res://Sprites/GUI/Att/attt3.png")
var tattg04 = preload("res://Sprites/GUI/Att/attt4.png")
var tattg05 = preload("res://Sprites/GUI/Att/attt5.png")
var tat0g01 = preload("res://Sprites/GUI/Att/attt1none.png")
var tat0g02 = preload("res://Sprites/GUI/Att/attt2none.png")
var tat0g03 = preload("res://Sprites/GUI/Att/attt3none.png")
var tat0g04 = preload("res://Sprites/GUI/Att/attt4none.png")
var tat0g05 = preload("res://Sprites/GUI/Att/attt5none.png")
var toui01 = preload("res://Sprites/GUI/Att/ouit.png")
#VAISSEAU
var shguit = preload("res://Sprites/GUI/Bars/barship.png")
var vaiattg01 = preload("res://Sprites/GUI/Att/attvai1.png")
var vaiattg02 = preload("res://Sprites/GUI/Att/attvai2.png")
var vaiattg03 = preload("res://Sprites/GUI/Att/attvai3.png")
var vaiatt0g01 = preload("res://Sprites/GUI/Att/attvai1none.png")
var vaiatt0g02 = preload("res://Sprites/GUI/Att/attvai2none.png")
var vaiatt0g03 = preload("res://Sprites/GUI/Att/attvai3none.png")

#Fonction Ready
func _ready():
	$Black.set_visible(true)
	$Black2.set_visible(true)
	$Blacktim.start(0.001)
	global_position.x = PlVar.nextx
	global_position.y = PlVar.nexty
	PlVar.player_pos = global_position
	PlVar.player = self
	PlVar.chargement = 0
	pass # Replace with function body.

#Fonction Process
# warning-ignore:unused_argument
func _process(delta):
	#Sons
	$SoulSound.set_volume_db(PlVar.son + 20)
	$SoundAttaque.set_volume_db(PlVar.son)
	$SoundHit.set_volume_db(PlVar.son + 10)
	$LaserSound.set_volume_db(PlVar.son + 10)
	
	#Pause
	if PlVar.pause == 0:
		$SOUL.paused = false
		$PIERRE.paused = false
		$LASER.paused = false
		$Laser.look_at(get_global_mouse_position())
	else:
		$SOUL.paused = true
		$PIERRE.paused = true
		$LASER.paused = true
	
	#Vegetcoup
	$Soul.modulate = Color(1,1,1,transoul)
	$Soul.scale = Vector2(soul, soul)
	if transoul > 0 and $Soul.visible == true:
		 $Soul/SoulArea/CollisionPolygon2D.set_disabled(false)
	else:
		$Soul/SoulArea/CollisionPolygon2D.set_disabled(true)
	
	#Progfercoup
	if cpierre == 0:
		$CerclePierre.visible = false
		for i in $CerclePierre.get_children():
			i.get_node("proj/CollisionPolygon2D").disabled = true
			i.get_node("ProjArea/CollisionPolygon2D").disabled = true
	else:
		$CerclePierre.visible = true
		for i in $CerclePierre.get_children():
			i.get_node("proj/CollisionPolygon2D").disabled = false
			i.get_node("ProjArea/CollisionPolygon2D").disabled = false
	
	
	#Récupération des variables du Singleton:
	pause = PlVar.pause
	if PlVar.dialo != 0:
		pause = 1
	PlVar.player_pos = global_position
	perso = PlVar.perso
	life = PlVar.life
	retoorn = PlVar.retoorn
	sens = PlVar.sens
	if PlVar.caradeg > 50:
		PlVar.caradeg = 50
	#Caméra
	if PlVar.animation == 1:
		$Camera2D.current = false
	else:
		$Camera2D.current = true
	$Camera2D.zoom.x = PlVar.zoom
	$Camera2D.zoom.y = PlVar.zoom
	$Camera2D.set_rotation_degrees(PlVar.rotate)
	$Camera2D.set_follow_smoothing(PlVar.smooth)

	#Actions
	if PlVar.map == 5 and PlVar.scenario[9] == "0" and PlVar.scenario[8] == "2":
		if PlVar.life < PlVar.diffveg/2:
			PlVar.action(5)
		else:
			PlVar.locscen[5] = "0"
		if PlVar.life < PlVar.diffveg/10:
			PlVar.action(6)
		else:
			PlVar.locscen[6] = "0"
		if PlVar.mana < 50:
			PlVar.action(7)
		else:
			PlVar.locscen[7] = "0"
		if PlVar.mana < 10:
			PlVar.action(8)
		else:
			PlVar.locscen[8] = "0"
	
	#Mort
	if PlVar.mort == 0:
		if life <= 0:
			print("Hey Brumen ! B")
			print("Isn't fair, isn't right, there's no reason to fight :^)")
			PlVar.mort = 1
			var b = part.instance()
			b.global_position = $posvegf.global_position
			if perso == -100 or perso == -101:
				b.start(11, 1)
			else:
				b.start(9, 1)
			get_parent().add_child(b)
			nbsig = PlVar.mana / 5
			while nbsig > 0:
				var c = sigma.instance()
				c.global_position = $posvegf.global_position
				get_parent().add_child(c)
				nbsig -= 1
			$vegface.set_visible(false)
			$vaisseau.set_visible(false)
			$Sprite.set_visible(false)
			
	if PlVar.mort == 1 or PlVar.mort == 2:
		PlVar.pause = 1
		if sah == 0:
			print("Hey Brumen ! 1")
			trans = 0
			$Blacktim.start(0.001)
			sah = 1
	#Affichage de la barre Sigma
	if PlVar.difftog != 0:
		vieaff = " x" + str(PlVar.vies)
	PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Numbers").text = "HP:" + str(int(PlVar.life)) + "/" + str(int(PlVar.diffveg)) + vieaff
	if PlVar.life > (PlVar.diffveg/3)*2:
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Numbers").set("custom_colors/font_color", Color(0, 1, (((PlVar.life/PlVar.diffveg)*100) - 66.666666)/33.333333))
	elif PlVar.life > (PlVar.diffveg/3) and PlVar.life <= (PlVar.diffveg/3)*2:
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Numbers").set("custom_colors/font_color", Color(1-((((PlVar.life/PlVar.diffveg)*100) - 33.333333)/33.333333), 1, 0))
	else:
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Numbers").set("custom_colors/font_color", Color(1, (((PlVar.life/PlVar.diffveg)*100))/33.333333, 0))
	PlVar.gui.get_node("Guigui/Bars/bar/Count/lifebar/TextureProgress").set_value(PlVar.mana)
	if pause == 0:
		if PlVar.cara == 0:
			#Attaque 01
			if Input.is_action_pressed("att01"):
				if isatt01 == 0:
					if perso == 0:
						PlVar.useveg = 1
						var b = vatt01.instance()
						b.global_position = $posvegf.global_position
						get_parent().add_child(b)
						PlVar.mana -= Stats.vegetstat[0][1][0]
						$SoundAttaque.stream = load("res://Sons/Att1.wav")
						$SoundAttaque.play()
						$Timer.start(0.2)
						isatt01 = 1
					if perso == 1:
						PlVar.usepro = 1
						var b = patt01.instance()
						b.global_position = $posvegf.global_position
						get_parent().add_child(b)
						$Timer.start(0.2)
						PlVar.mana -= Stats.progferstat[0][1][0]
						isatt01 = 1
					if perso == 2:
						PlVar.useddo = 1
						var b = datt01.instance()
						b.global_position = $posvegf.global_position
						get_parent().add_child(b)
						$Timer.start(0.6)
						PlVar.mana -= Stats.doubstat[0][1][0]
						isatt01 = 1
					if perso == 3:
						PlVar.usetog = 1
						var b = tatt01.instance()
						b.global_position = $posvegf.global_position
						get_parent().add_child(b)
						$Timer.start(0.8)
						PlVar.mana -= Stats.togstat[0][1][0]
						isatt01 = 1
					if perso == -101:
						if tirvai == 1:
							$posvaif.position = Vector2(-32, 7)
							tirvai += 1
						if tirvai == 0:
							$posvaif.position = Vector2(-31, 4)
							tirvai += 1
						if tirvai > 1:
							tirvai = 0
						var b = vaitt01.instance()
						b.global_position = $posvaif.global_position
						get_parent().add_child(b)
						PlVar.mana -= Stats.vaistat[0][1][0]
						$SoundAttaque.stream = load("res://Sons/Att1.wav")
						$SoundAttaque.play()
						$Timer.start(0.1)
						isatt01 = 1
			#Attaque 02
			if Input.is_action_pressed("att02"):
				if perso == 1:
						if PlVar.mana >= Stats.progferstat[1][1][1]:
							PlVar.usepro = 1
							if PlVar.cara == 0:
								$oclock.start(0.1)
								var b = part.instance()
								b.global_position = $poseffect.global_position
								b.start(5, 0.2)
								get_parent().add_child(b)
							PlVar.cara = 1
							isatt02 = 1
				if perso == 3:
					PlVar.usetog = 1
					if PlVar.mana >= Stats.togstat[1][1][1]:
						if PlVar.cara == 0:
							$oclock.start(0.1)
						PlVar.cara = 2
						vel = (target - position).normalized() * speed
						isatt02 = 1
				if isatt02 == 0:
					if perso == 0:
						PlVar.useveg = 1
						if life < PlVar.diffveg:
							if PlVar.mana >= life * Stats.vegetstat[1][1][0]:
								var b = part.instance()
								b.global_position = $poseffect.global_position
								if sens == 0 or 1:
									b.start(2, 0.25)
								if sens == 2:
									b.start(3, 0.25)
								if sens == 3:
									b.start(4, 0.25)
								get_parent().add_child(b)
								PlVar.mana -= life * Stats.vegetstat[1][1][0]
								life += life * Stats.vegetstat[1][0][0]
								$SoundAttaque.stream = load("res://Sons/Life_Gain_Sound.wav")
								$SoundAttaque.play()
								if life > PlVar.diffveg:
									life = PlVar.diffveg
								if PlVar.map == 5 and PlVar.scenario[9] == "0" and PlVar.scenario[8] == "2":
									PlVar.action(2)
								$Timer.start(0.25)
								isatt02 = 1
					if perso == 2:
						PlVar.useddo = 1
						if PlVar.mana >= Stats.doubstat[1][1][1]:
							var b = datt02.instance()
							b.global_position = get_global_mouse_position()
							get_parent().add_child(b)
							$Timer.start(0.6)
							PlVar.mana -= Stats.doubstat[1][1][1]
							isatt02 = 1
					if perso == -101:
						if PlVar.mana >= Stats.vaistat[1][1][1]:
							var b = vaitt02.instance()
							b.global_position = get_global_mouse_position()
							get_parent().add_child(b)
							$Timer.start(0.6)
							PlVar.mana -= Stats.vaistat[1][1][1]
							isatt02 = 1
		if Input.is_action_just_released("att02"):
				if perso == 1:
						if PlVar.cara == 1:
							var b = part.instance()
							b.global_position = $poseffect.global_position
							b.start(5, 0.2)
							get_parent().add_child(b)
							PlVar.cara = 0
							isatt02 = 0
				if perso == 3:
					if PlVar.cara == 2:
						PlVar.cara = 0
						isatt02 = 0
		#Attaque 03
		if PlVar.cara == 0:
			if Input.is_action_pressed("att03"):
				if isatt03 == 0:
					if perso == -101:
						if PlVar.mana >= Stats.vaistat[2][1][1]:
							if tirvai == 1:
								$posvaif.position = Vector2(-32, 7)
								tirvai += 1
							if tirvai == 0:
								$posvaif.position = Vector2(-31, 4)
								tirvai += 1
							if tirvai > 1:
								tirvai = 0
							var b = vaitt03.instance()
							b.global_position = $posvaif.global_position
							get_parent().add_child(b)
							PlVar.mana -= Stats.vaistat[2][1][0]
							$SoundAttaque.stream = load("res://Sons/Att1.wav")
							$SoundAttaque.play()
							$Timer.start(0.8)
							isatt03 = 1
					if perso == 2:
						PlVar.useddo = 1
						if PlVar.mana >= Stats.doubstat[2][1][1]:
							var b = datt03.instance()
							b.global_position = get_global_mouse_position()
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.doubstat[2][1][0], Stats.doubstat[2][1][1])
							$Timer.start(0.2)
							isatt03 = 1
					if perso == 3:
						PlVar.usetog = 1
						if PlVar.mana >= Stats.togstat[2][1][1]:
							var b = tatt03.instance()
							b.global_position = $posvegf.global_position
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.togstat[2][1][0], Stats.togstat[2][1][1])
							$Timer.start(0.3)
							isatt03 = 1
				if isatt01 or isatt02 == 0:
					if perso == 0:
						PlVar.useveg = 1
						if PlVar.mana >= Stats.vegetstat[2][1][0]:
							var b = vatt03.instance()
							b.global_position = get_global_mouse_position()
							get_parent().add_child(b)
							isatt03 = 1
				if isatt03 == 0:
					if perso == 1:
						PlVar.usepro = 1
						if PlVar.mana >= PlVar.caradeg + Stats.progferstat[2][1][1]:
							PlVar.cara = 3
							var b = part.instance()
							b.global_position = $poseffect.global_position
							b.start(5, 0.2)
							get_parent().add_child(b)
							b = patt03.instance()
							b.global_position = $poseffect.global_position
							get_parent().add_child(b)
							PlVar.mana -= PlVar.caradeg + Stats.progferstat[2][1][1]
							if PlVar.map == 5 and PlVar.scenario[9] == "0" and PlVar.scenario[8] == "2":
								PlVar.action(3)
							isatt03 = 1
								
							
			if Input.is_action_just_released("att03"):
					if isatt03 == 1:
						if perso == 0:
								isatt03 = 0
		if retoorn == 1:
			if PlVar.cara == 3:
				PlVar.cara = 0
				if perso == 1:
					var b = part.instance()
					b.global_position = $poseffect.global_position
					b.start(5, 0.2)
					get_parent().add_child(b)
				isatt03 = 0
				PlVar.caradeg = 0
				retoorn = 0
		#Attaque 04
		if PlVar.cara == 0:
			if Input.is_action_pressed("att04"):
				if isatt04 == 0:
					if perso == 0:
						PlVar.useveg = 1
						if PlVar.mana >= Stats.vegetstat[3][1][1]:
							var b = vatt04.instance()
							if sens == 0:
								b.global_position = $D.global_position
							if sens == 1:
								b.global_position = $U.global_position
							if sens == 2:
								b.global_position = $R.global_position
							if sens == 3:
								b.global_position = $L.global_position
							b.start(-1)
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.vegetstat[3][1][0], Stats.vegetstat[3][1][1])
							$Timer.start(0.5)
							isatt04 = 1
					if perso == 1:
						PlVar.usepro = 1
						if PlVar.mana >= Stats.progferstat[3][1][1]:
							var b = patt04.instance()
							b.global_position = $posvegf.global_position
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.progferstat[3][1][0],Stats.progferstat[3][1][1])
							$Timer.start(0.5)
							isatt04 = 1
					if perso == 2:
						PlVar.useddo = 1
						if PlVar.mana >= Stats.doubstat[3][1][1]:
							var b = datt04.instance()
							b.global_position = $posvegf.global_position
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.doubstat[3][1][0], Stats.doubstat[3][1][1])
							$Timer.start(0.5)
							if PlVar.map == 5 and PlVar.scenario[9] == "0" and PlVar.scenario[8] == "2":
								PlVar.action(4)
							isatt04 = 1
					if perso == 3:
						PlVar.usetog = 1
						if PlVar.mana >= Stats.togstat[3][1][1]:
							var b = tatt04.instance()
							b.global_position = $posvegf.global_position
							get_parent().add_child(b)
							PlVar.mana -= rand_range(Stats.togstat[3][1][0],Stats.togstat[3][1][1])
							$Timer.start(0.5)
							isatt04 = 1
		#Attaque Spéciale
		if PlVar.cara == 0:
			if Input.is_action_pressed("att05"):
				if isatt05 == 0:
					if PlVar.scenario[16] == "1":
						if perso == 0:
							PlVar.useveg = 1
							if PlVar.mana >= Stats.vegetstat[4][1][0]:
								isatt05 = 1
								PlVar.mana -= Stats.vegetstat[4][1][0]
								life = PlVar.diffveg
								var b = part.instance()
								b.global_position = $poseffect.global_position
								if sens == 0 or 1:
									b.start(2, 0.25)
								if sens == 2:
									b.start(3, 0.25)
								if sens == 3:
									b.start(4, 0.25)
								get_parent().add_child(b)
								$SOUL.start(0.00001)
								soul = 1
								transoul = 1
								$SoulSound.play()
								$Soul.set_visible(true)
						if perso == 1:
							PlVar.usepro = 1
							if PlVar.mana >= Stats.progferstat[4][1][0]:
								isatt05 = 1
								PlVar.mana -= Stats.progferstat[4][1][0]
								$SoundAttaque.stream = load("res://Sons/att1progferlaunch.wav")
								$SoundAttaque.play()
								for i in $CerclePierre.get_children():
									i.play("app")
								cpierre = 1
								$PIERRE.start(0.00001)
						if perso == 2:
							PlVar.useddo = 1
							if PlVar.mana >= Stats.doubstat[4][1][0]:
								isatt05 = 1
								PlVar.mana -= Stats.doubstat[4][1][0]
								fusion = 0
								PlVar.cara = 4
								var b = part.instance()
								b.global_position = self.global_position
								b.start(21, 0.5)
								get_parent().add_child(b)
								$FUSION.start(0.1)
						if perso == 3:
							PlVar.usetog = 1
							if PlVar.mana >= Stats.togstat[4][1][0]:
								isatt05 = 1
								PlVar.mana -= Stats.togstat[4][1][0]
								$LaserSound.play()
								$LASER.start(3)
								$Laser.visible = true
								$Laser/LaserArea/CollisionPolygon2D.disabled = false
		
		#Processus de sélection
		if perso == 0:
			if PlVar.cara != 0:
				PlVar.cara = 0
				isatt02 = 0
				retoorn = 1
		if perso == 1:
			if PlVar.cara != 1 and PlVar.cara != 3:
				PlVar.cara = 0
				isatt02 = 0
	
		if perso == 2:
			if PlVar.cara != 4:
				PlVar.cara = 0
				isatt02 = 0
				retoorn = 1
		if perso == 3:
			if PlVar.cara != 2:
				PlVar.cara = 0
				retoorn = 1
		if PlVar.mana <= 0.1:
			if PlVar.cara != 3 and PlVar.cara != 4:
				PlVar.cara = 0
				retoorn = 1
				isatt02 = 0
				isatt03 = 0
	#Spécificités aux persos
	if perso == 0:
		speed = 100
		defense = 1
		$Sprite.position.x = 0.5
		$Sprite.position.y = 16
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").text = "VEGET"
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").set("custom_colors/font_color", Color(0.039216, 0.384314, 0))
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background").set_texture(vguit)
		if PlVar.mana >= Stats.vegetstat[0][1][0]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(vattg01)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(vat0g01)
		if PlVar.mana >= life * Stats.vegetstat[1][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(vattg02)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(vat0g02)
		if PlVar.mana >= Stats.vegetstat[2][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(vattg03)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(vat0g03)
		if PlVar.mana >= Stats.vegetstat[3][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(vattg04)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(vat0g04)
		if PlVar.mana >= Stats.vegetstat[4][1][0]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(vattg05)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(vat0g05)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(voui01)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(voui01)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(voui01)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(voui01)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(voui01)
		get_node("HitboxVeget").set_disabled(false)
		get_node("HitboxProgfer").set_disabled(true)
		get_node("HitboxDoub").set_disabled(true)
		get_node("HitboxTog").set_disabled(true)
		get_node("HitboxVai").set_disabled(true)
		get_node("HitboxVai2").set_disabled(true)
	if perso == 1:
		if PlVar.cara != 3:
			speed = 75
		else:
			speed = 150
		defense = 2
		$Sprite.position.x = 0
		$Sprite.position.y = 23.5
		PlVar.gui.get_node('Guigui/Bars/bar/Count/Background/Name').text = "PROGFER"
		PlVar.gui.get_node('Guigui/Bars/bar/Count/Background/Name').set("custom_colors/font_color", Color(0.34902, 0.211765, 0))
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background").set_texture(pguit)
		if PlVar.mana >= Stats.progferstat[0][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(pattg01)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(pat0g01)
		if PlVar.mana >= Stats.progferstat[1][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(pattg02)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(pat0g02)
		if PlVar.mana >= PlVar.caradeg + Stats.progferstat[2][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(pattg03)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(pat0g03)
		if PlVar.mana >= Stats.progferstat[3][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(pattg04)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(pat0g04)
		if PlVar.mana >= Stats.progferstat[4][1][0]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(pattg05)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(pat0g05)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(poui01)
		get_node("HitboxVeget").set_disabled(true)
		get_node("HitboxProgfer").set_disabled(false)
		get_node("HitboxDoub").set_disabled(true)
		get_node("HitboxTog").set_disabled(true)
		get_node("HitboxVai").set_disabled(true)
		get_node("HitboxVai2").set_disabled(true)
	if perso == 2:
		if PlVar.cara != 4:
			speed = 100
			defense = 0.7
		else:
			speed = 0
			defense = 100
		
		$Sprite.position.x = 1.5
		$Sprite.position.y = 27
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").text = "DOUBLIKS"
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").set("custom_colors/font_color", Color(0.529412, 0.529412, 0.529412))
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background").set_texture(dguit)
		if PlVar.mana >= Stats.doubstat[0][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(dattg01)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(dat0g01)
		if PlVar.mana >= Stats.doubstat[1][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(dattg02)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(dat0g02)
		if PlVar.mana >= Stats.doubstat[2][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(dattg03)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(dat0g03)
		if PlVar.mana >= Stats.doubstat[3][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(dattg04)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(dat0g04)
		if PlVar.mana >= Stats.doubstat[4][1][0]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(dattg05)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(dat0g05)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(doui01)
		get_node("HitboxVeget").set_disabled(true)
		get_node("HitboxProgfer").set_disabled(true)
		get_node("HitboxDoub").set_disabled(false)
		get_node("HitboxTog").set_disabled(true)
		get_node("HitboxVai").set_disabled(true)
		get_node("HitboxVai2").set_disabled(true)
	if perso == 3:
		speed = 150
		defense = 0.8
		$Sprite.position.x = 0.5
		$Sprite.position.y = 16
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").text = "TOG"
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").set("custom_colors/font_color", Color(0, 0.364706, 0.627451))
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background").set_texture(tguit)
		if PlVar.mana >= Stats.togstat[0][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(tattg01)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(tat0g01)
		if PlVar.mana >= Stats.togstat[1][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(tattg02)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(tat0g02)
		if PlVar.mana >= Stats.togstat[2][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(tattg03)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(tat0g03)
		if PlVar.mana >= Stats.togstat[3][1][1]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(tattg04)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(tat0g04)
		if PlVar.mana >= Stats.togstat[4][1][0]:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(tattg05)
		else:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5").set_texture(tat0g05)
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(toui01)
		get_node("HitboxVeget").set_disabled(true)
		get_node("HitboxProgfer").set_disabled(true)
		get_node("HitboxDoub").set_disabled(true)
		get_node("HitboxTog").set_disabled(false)
		get_node("HitboxVai").set_disabled(true)
		get_node("HitboxVai2").set_disabled(true)
	if perso == -100 or perso == -101:
		speed = 200
		if perso == -100:
			PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").text = "W-868"
			get_node("HitboxVai").set_disabled(false)
			get_node("HitboxVai2").set_disabled(true)
			$vaisseau.position = Vector2(-486, -109)
			$vaisseau.scale = Vector2(1,1)
		if perso == -101:
			PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").text = "WF-89"
			get_node("HitboxVai").set_disabled(true)
			get_node("HitboxVai2").set_disabled(false)
			$vaisseau.set_animation("better")
			$vaisseau.position = Vector2(-30, 0)
			$vaisseau.scale = Vector2(1.5,1.5)
			if PlVar.mana >= Stats.vaistat[0][1][1]:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(vaiattg01)
			else:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque1").set_texture(vaiatt0g01)
			if PlVar.mana >= Stats.vaistat[1][1][1]:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(vaiattg02)
			else:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque2").set_texture(vaiatt0g02)
			if PlVar.mana >= Stats.vaistat[2][1][1]:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(vaiattg03)
			else:
				PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque3").set_texture(vaiatt0g03)
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(toui01)
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/attaque4").set_texture(null)
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background/Name").set("custom_colors/font_color", Color(0.243137, 0.309804, 0.443137))
		PlVar.gui.get_node("Guigui/Bars/bar/Count/Background").set_texture(shguit)
		get_node("HitboxVeget").set_disabled(true)
		get_node("HitboxProgfer").set_disabled(true)
		get_node("HitboxDoub").set_disabled(true)
		get_node("HitboxTog").set_disabled(true)
		if PlVar.mort == 0:
			$vaisseau.set_visible(true)
			$vegface.set_visible(false)
			$Sprite.set_visible(false)
	else:
		if PlVar.mort == 0:
			$vaisseau.set_visible(false)
			$vegface.set_visible(true)
			$Sprite.set_visible(true)
	if PlVar.cara != 0:
		$vegface.set_animation(str(PlVar.cara))
	if pause == 0:
		if PlVar.cara == 1:
			if perso == 1:
				if PlVar.mana <= 0.1:
					var b = part.instance()
					b.global_position = $poseffect.global_position
					b.start(5, 0.2)
					get_parent().add_child(b)
					PlVar.cara = 0
					isatt02 = 0
		if PlVar.cara == 2:
			if perso == 3:
				speed = 400
				target = get_global_mouse_position()
		if PlVar.cara == 3:
			if perso == 1:
				speed = 150
		if PlVar.cara == 0 or PlVar.cara == 3:
			#Déplacements
			vel.x = 0
			vel.y = 0
			if Input.is_action_pressed("ui_left"):
				vel.x -= speed
				if perso == 0:
					$posvegf.position.x = -8
					$posvegf.position.y = 1
				if perso == 1:
					$posvegf.position.x = -8
					$posvegf.position.y = 7.5
				if perso == 2:
					$posvegf.position.x = -4.5
					$posvegf.position.y = 15
				if perso == 3:
					$posvegf.position.x = -3
					$posvegf.position.y = 1
				sens = 3
			if Input.is_action_pressed("ui_right"):
				vel.x += speed
				if perso == 0:
					$posvegf.position.x = 8
					$posvegf.position.y = 1
				if perso == 1:
					$posvegf.position.x = 8
					$posvegf.position.y = 7.5
				if perso == 2:
					$posvegf.position.x = 6
					$posvegf.position.y = 15
				if perso == 3:
					$posvegf.position.x = 4
					$posvegf.position.y = 1
				sens = 2
			if Input.is_action_pressed("ui_up"):
				vel.y -= speed
				if perso == 0:
					$posvegf.position.x = 6
					$posvegf.position.y = -10
				if perso == 1:
					$posvegf.position.x = 0
					$posvegf.position.y = 10
				if perso == 2:
					$posvegf.position.x = 1
					$posvegf.position.y = -6
				if perso == 3:
					$posvegf.position.x = 1
					$posvegf.position.y = -0.5
				sens = 1
			if Input.is_action_pressed("ui_down"):
				vel.y += speed
				if perso == 0:
					$posvegf.position.x = -4
					$posvegf.position.y = 8
				if perso == 1:
					$posvegf.position.x = 0
					$posvegf.position.y = 10
				if perso == 2:
					$posvegf.position.x = 0
					$posvegf.position.y = 18
				if perso == 3:
					$posvegf.position.x = 1
					$posvegf.position.y = 1
				sens = 0
			if vel.length() != 0:
				mov = 1
			else:
				mov = 0
			isatt = isatt01 + isatt02 + isatt03 + isatt04
			if isatt != 0:
				isatt = 1
			if PlVar.cara == 0:
				if dam == 0:
					if vel.length() != 0:
						vel = vel.normalized() * speed
					if perso == -101:
						$vaisseau.set_animation("better")
					elif perso == -100:
						$vaisseau.set_animation("default")
					else:
						$vegface.set_animation(str(perso) + str(sens) + str(isatt) + str(mov) + str(dam))
				if dam == 1:
					if perso == -101:
						$vaisseau.set_animation("betterdam")
					else:
						$vegface.set_animation(str(perso) + str(sens) + "0" + "0" + str(dam))
			# warning-ignore:return_value_discarded
			move_and_slide(vel)
	if pause == 1:
		if PlVar.cara == 0:
			if perso == -101:
				$vaisseau.set_animation("better")
			elif perso == -100:
				$vaisseau.set_animation("default")
			else:
				$vegface.set_animation(str(perso) + str(sens) + "000")
		else:
			$vegface.set_animation(str(PlVar.cara))
	#Affichage du GUI d'attaque
	if isatt01 == 0:
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(null)
	if isatt02 == 0:
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(null)
	if isatt03 == 0:
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(null)
	if isatt04 == 0:
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(null)
	if isatt05 == 0:
		PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(null)
	if isatt01 == 1:
		if perso == 0:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(voui01)
		if perso == 1:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(poui01)
		if perso == 2:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(doui01)
		if perso == 3 or perso == -101:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui1").set_texture(toui01)
	if isatt02 == 1:
		if perso == 0:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(voui01)
		if perso == 1:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(poui01)
		if perso == 2:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(doui01)
		if perso == 3 or perso == -101:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui2").set_texture(toui01)
	if isatt03 == 1:
		if perso == 0:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(voui01)
		if perso == 1:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(poui01)
		if perso == 2:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(doui01)
		if perso == 3 or perso == -101:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui3").set_texture(toui01)
	if isatt04 == 1:
		if perso == 0:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(voui01)
		if perso == 1:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(poui01)
		if perso == 2:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(doui01)
		if perso == 3 or perso == -101:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui4").set_texture(toui01)
	if isatt05 == 1:
		if perso == 0:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(voui01)
		if perso == 1:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(poui01)
		if perso == 2:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(doui01)
		if perso == 3 or perso == -101:
			PlVar.gui.get_node("VBoxContainer/barre/MarginContainer/NinePatchRect/oui5").set_texture(toui01)
	#Renvoi des variables au Singleton
	PlVar.life = life
	PlVar.vel = global_position
	PlVar.retoorn = retoorn
	PlVar.sens = sens
	
	pass
# warning-ignore:unused_argument
func _physics_process(delta):
	if PlVar.cara == 2:
		if perso == 3:
			vel = (target - position).normalized() * speed
			# warning-ignore:return_value_discarded
			move_and_slide(vel)

func _on_Timer_timeout():
	if isatt01 == 1:
		isatt01 = 0
	if isatt02 == 1:
		isatt02 = 0
	if isatt03 == 1:
		isatt03 = 0
	if isatt04 == 1:
		isatt04 = 0
	pass # Replace with function body.

func _on_oclock_timeout():
	if PlVar.cara == 1:
		PlVar.mana -= Stats.progferstat[1][1][1]*PlVar.uldelta
		$oclock.start(0.1)
	if PlVar.cara == 2:
		PlVar.mana -= Stats.togstat[1][1][1]*PlVar.uldelta
		var b = tatt02.instance()
		b.global_position = $poseffect.global_position
		get_parent().add_child(b)
		$oclock.start(0.1)
	pass # Replace with function body.

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if PlVar.cara != 1:
			if dam == 0:
				life = PlVar.life
				life -= (damage/defense)*PlVar.diffdoo
				PlVar.life = life
				var shit = rand_range(0, 1)
				if shit < 0.5:
					$SoundHit.stream = load("res://Sons/Hit1.wav")
				if shit >= 0.5:
					$SoundHit.stream = load("res://Sons/Hit2.wav")
				$SoundHit.play()
				$Camera2D.shake(0.06*damage*PlVar.diffdoo,damage*0.5*PlVar.diffdoo,damage*0.5*PlVar.diffdoo)
				$rollback.start(0.1)
				dam = 1
		else:
			if dam == 0:
				PlVar.caradeg += damage*PlVar.diffdoo
				$rollback.start(0.1)
				dam = 1


func _on_rollback_timeout():
	dam = 0
	pass # Replace with function body.


func _on_Blacktim_timeout():
	if trans <= 1 and trans > -100000:
		trans += 0.01*PlVar.uldelta
		if PlVar.mort == 3:
			print("Hey Brumen ! 3")
			$vegface.set_visible(false)
			$Sprite.set_visible(false)
			PlVar.phase = -2
			trans = -10000000
			pass
		if PlVar.mort == 0 or PlVar.mort == 3:
			$Black.set_modulate(Color(1,1,1, 1-trans))
			$Blacktim.start(0.01)
			pass
		if PlVar.mort == 1 or PlVar.mort == 2:
			$Black.set_modulate(Color(1,1,1, 0+trans))
			$Blacktim.start(0.02)
			pass
		pass
	if trans >= 1:
		if PlVar.mort == 3:
			PlVar.chargement = 0
			pass
		if PlVar.mort == 2:
			print("Hey Brumen ! 2")
			$Blacktim.start(0.5)
			PlVar.mort = 3
			trans = 0
			pass
		if PlVar.mort == 1:
			print("Hey Brumen ! D")
			if protection == 1:
				print("Hey Brumen ! E")
				PlVar.mort = 0
				PlVar.chargement = 0
				PlVar.pause = 0
				sah = 0
				print("Hey Brumen ! F")
				PlVar.vies -= 1
				if PlVar.vies == 0 and PlVar.difftog != 0:
					PlVar.reset_game()
				else:
					PlVar.load_game()
					PlVar.load_cfg()
				protection = 0
				pass
			if protection == 0:
				if PlVar.chargement == 0:
					print("Hey Brumen ! ?")
					PlVar.chargement = 1
					protection = 1
					$Blacktim.start(1.5)
				pass
			pass
		pass
	pass # Replace with function body.



func _on_SoundAttaqueDup_finished():
	
	pass # Replace with function body.


func _on_SOUL_timeout():
	if transoul > 0:
		transoul -= 0.005*PlVar.uldelta
		soul += 0.5*PlVar.uldelta
		$SOUL.start(0.0001)
	else:
		isatt05 = 0
		transoul = 0
		soul = 1
		$Soul.visible = false
	pass # Replace with function body.


func _on_SoulArea_body_entered(body):
	if "soldier" in body.name:
		body.hit(rand_range(Stats.vegetstat[4][0][0]/2, Stats.vegetstat[4][0][1]/2))
	pass # Replace with function body.


func _on_ProjArea_body_entered(body):
	if "soldier" in body.name:
		body.hit(rand_range(Stats.progferstat[4][0][0], Stats.progferstat[4][0][1]))
	pass # Replace with function body.


func _on_PIERRE_timeout():
	if $CerclePierre.rotation_degrees < 500:
		$CerclePierre.rotation_degrees += 1*PlVar.uldelta
		$PIERRE.start(0.01)
	else:
		for i in $CerclePierre.get_children():
			i.play("dapp")
			isatt05 = 0
	pass # Replace with function body.


func _on_Pierre_animation_finished():
	for i in $CerclePierre.get_children():
		if i.animation == "dapp":
			cpierre = 0
		if i.animation == "app":
			i.play("default")
	pass # Replace with function body.


func _on_LaserArea_body_entered(body):
	if "soldier" in body.name:
		body.hit(rand_range(Stats.togstat[4][0][0], Stats.togstat[4][0][1]))
	pass # Replace with function body.


func _on_LASER_timeout():
	$Laser.visible = false
	isatt05 = 0
	$Laser/LaserArea/CollisionPolygon2D.disabled = true
	$LaserSound.stop()
	pass # Replace with function body.


func _on_LaserSound_finished():
	$LaserSound.play()
	pass # Replace with function body.


func _on_FUSION_timeout():
	fusion += 0.1*PlVar.uldelta
	if fusion < 8:
		var rand = 0
		rand = int(rand_range(0, 2))
		if rand == 0:
			var b = datt03.instance()
			b.global_position = get_global_mouse_position()
			get_parent().add_child(b)
		else:
			var b = datt02.instance()
			b.global_position = get_global_mouse_position()
			get_parent().add_child(b)
	else:
		if PlVar.cara == 4 and isatt05 == 1:
			var b = part.instance()
			b.global_position = self.global_position
			b.start(21, 0.5)
			get_parent().add_child(b)
			PlVar.cara = 0
			isatt05 = 0
	pass # Replace with function body.
