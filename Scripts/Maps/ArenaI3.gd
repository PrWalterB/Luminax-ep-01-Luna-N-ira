extends Node
var viteyes = 0
var laser = 0
var poslas = [0, 0.290, 0.390, 0.490, 0.590, 0.890, 1.190, 1.590]
var suposlas = [0, 1.591, 3.191, 6.390, 7.991, 9.591, 12.791, 14.390, 15.991, 19.191, 20.791, 22.391, 25.591, 27.191, 28.791, 32.023, 33.591, 35.191, 76.891, 78.391, 79.991, 83.258, 84.791, 86.391, 102.381, 103.991, 105.591, 108.858, 110.391, 111.991, 115.191, 116.791, 118.391, 120.591, 123.191, 186.977]
var suposlas2 = [4.791, 11.191, 17.591, 23.991, 30.391, 36.791, 81.591, 87.991, 107.191, 113.591, 119.991]
var poslas2 = [4.790, 5.090, 5.190, 5.290, 5.390, 5.790, 5.990, 6.190, 6.390]
var pospiks = [6.271, 23.622, 38.396, 52.246, 70.289, 76.907, 90.449, 94.219, 95.951, 100.914, 108.762, 114.879, 142.618, 157.968, 169.821]
var posmis = [25.565, 37.650, 115.216, 124.834]
var posent = [[38.588, -5], [39.781, 5.5], [41.589, -5], [42.974, 5.5], [45.090, -5], [46.167, 5.5], [47.975, -7.5], [48.783, 8], [49.553, -2.5], [51.168, 0], [157.891, -5], [158.622, 5.5], [159.777, 0], [165.355, -5], [166.009, 5.5], [167.125, 0], [172.703, -5], [173.396, 5.5], [174.242, 0], [179.898, -5], [180.821, 5.5], [181.937, 0]]
var posdisk = [51.169, 76.637, 157.853, 186.853]
var posol = [127.960, 157.891]
var simp = 1
var simper = 1
var simp2 = 1
var simper2 = 1
var semper = 0
var soler = 0
var vitsen = 0
var spiker = 0
var misser = 0
var miss = 0
var spikus = 0
var disker = 0
var disk = 0
var cage = 0
var solspw = 0
var rand = 0
var decide = 0
var turncaj = 0
# warning-ignore:unused_class_variable
var nbsave = 0
var dials = [[0,0],[194,204],[205,206],[207,208],[209,210],[211,214]]
var seldial = 0
var currdial = 0
var proj = preload("res://Scenes/Projectiles/Mobs/enproj4.tscn")
var sol0 = preload("res://Scenes/Entities/soldier.tscn")
var sol1 = preload("res://Scenes/Entities/bigsoldier.tscn")
var sol2 = preload("res://Scenes/Entities/unit.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 14
	PlVar.bosslife = 600*PlVar.diffpro
	PlVar.maxbosslife = 600*PlVar.diffpro
	PlVar.chargement = 1
	PlVar.save_game()
	$Charge.start(1)
	PlVar.dialo = 1
	PlVar.phase = 1024
	var b = dialogb.instance()
	add_child(b)
	if int(PlVar.scenario[14]) + int(PlVar.scenario[15]) != 2:
		get_node("Node2D/Dialogues/0001046/CollisionShape2D").set_disabled(true)
	else:
		get_node("Node2D/Dialogues/0001044/CollisionShape2D").set_disabled(true)
	for i in $Node2D/Perso.get_children():
		if "Cygien" in i.name:
			for a in i.get_children():
				if "00Cygien" in a.name:
					var col1 = rand_range(-0.1, 1.9)
					var col2 = rand_range(-0.1, 1.9)
					var col3 = rand_range(-0.1, 1.9)
					a.get_node("color").modulate = Color(int(col1), int(col2), int(col3), rand_range(0.5, 1))
					if PlVar.bosslife <= 0:
						a.get_node("color").modulate = Color(0, 0, 0, 1)
	viteyes = 0.5
	$SOLPOS.start(0.5)
	$Node2D/player.global_position = Vector2(1523,2543)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == 1054:
		$Node2D/Barriers.set_visible(true)
		$Node2D/walls/barrier.set_disabled(false)
		PlVar.deblock = "11111"
		get_node("Node2D/Dialogues/1Boss4dial").queue_free()
		PlVar.scenario[17] = "1"
		PlVar.bosslife = 600*PlVar.diffpro
		PlVar.maxbosslife = 600*PlVar.diffpro
		get_node("CanvasLayer").bossf(4)
		seldial = 1
		currdial = dials[seldial][0]
		PlVar.action(currdial)
		$DIALOS.start(PlVar.vitphac + 0.1)
		$TEMPO.start(0.0001)
		$SUPSIC.start(0.00000001)
		$SUPSIC2.start(suposlas2[0])
		$SENTMOV.start(0.01)
	if PlVar.bosslife <= 0:
		$Node2D/player/Black2.fondu(-0.01, 1, 1)
		if int(PlVar.scenario[17]) < 3:
			laser = 0
			PlVar.scenario[17] = str(int(PlVar.scenario[17]) + 2)
			PlVar.cara = 0
			PlVar.save_succ(16)
			PlVar.dialo = 1
			$DEATH.start(10)
	if PlVar.pause == 0 and PlVar.dialo == 0:
		$TEMPO.paused = false
		$MUSIC.paused = false
		$SUPSIC.paused = false
		$SUPSIC2.paused = false
		$MUSIC2.paused = false
		$SPIKES.paused = false
		$SHOOT.paused = false
		$SHOOTER.paused = false
		$SENTI.paused = false
		$SENTMOV.paused = false
		$DISK.paused = false
		$SOLPOS.paused = false
		$SOLSPAWN.paused = false
		$Downforce.stream_paused = false
	if (PlVar.pause != 0 and PlVar.dialo != 0) or PlVar.bosslife <= 0:
		$TEMPO.paused = true
		$MUSIC.paused = true
		$SUPSIC.paused = true
		$SUPSIC2.paused = true
		$MUSIC2.paused = true
		$SPIKES.paused = true
		$SHOOT.paused = true
		$SHOOTER.paused = true
		$SENTI.paused = true
		$SENTMOV.paused = true
		$DISK.paused = true
		$SOLPOS.paused = true
		$SOLSPAWN.paused = true
		$Downforce.stream_paused = true
	$Node2D/Tour/Screen.modulate = Color(float((float(laser)/9) + spikus)/2, float(posent[semper][1])/8, miss, 1)
	for i in $Node2D/Tour/Screen.get_children():
		i.texture = load("res://Sprites/Props/Cygio/screens/"+ str(laser) + ".png")
		i.modulate = Color(float((float(laser)/9) + spikus)/2, float(posent[semper][1])/15, miss, 1)
		if semper != 0:
			if semper != 0:
				if posent[semper-1][1] != 0:
					i.texture = load("res://Sprites/Props/Cygio/screens/ray"+ str(posent[semper-1][1]) + ".png")
	for i in $Node2D/PointsSenti.get_children():
		i.look_at(i.get_parent().global_position)
		if PlVar.pause == 0 and PlVar.dialo == 0:
			var vel = Vector2(vitsen*10, 0).rotated(i.rotation)
			# warning-ignore:RETURN_VALUE_DISCARDED
			i.move_and_slide(vel)
	for i in $Node2D/Sentinelles.get_children():
		if "ray" in i.name:
			if PlVar.bosslife <= 0:
				i.queue_free()
			var suiv = str(int(i.name[3]) + 1)
			if suiv == "9":
				suiv = "1"
			var velray = (i.get_parent().get_node("senti" + suiv + "/Position2D").global_position - i.get_parent().get_node("senti" + i.name[3] + "/Position2D").global_position).normalized()
			i.scale.x = sqrt(pow(i.get_parent().get_node("senti" + i.name[3] + "/Position2D").global_position.x-i.get_parent().get_node("senti" + suiv + "/Position2D").global_position.x, 2)+pow(i.get_parent().get_node("senti" + i.name[3] + "/Position2D").global_position.y-i.get_parent().get_node("senti" + suiv + "/Position2D").global_position.y, 2))
			var rotation_dir = velray.angle()
			i.rotation = rotation_dir
			i.global_position = i.get_parent().get_node("senti" + i.name[3] + "/Position2D").global_position
			if vitsen != 0:
				i.visible = true
				i.get_node("rayarea/CollisionShape2D").disabled = false
			else:
				i.visible = false
				i.get_node("rayarea/CollisionShape2D").disabled = true
		if "senti" in i.name:
			if PlVar.bosslife <= 0:
				var b = particule.instance()
				b.global_position = i.global_position
				b.start(56, 1)
				$Node2D.add_child(b)
				i.queue_free()
			i.global_position = self.get_node("Node2D/PointsSenti/point" + i.name[5]).global_position
			if disk == 0:
				i.get_node("front").set_animation("default")
				i.get_node("Area2Dsenti/CollisionPolygon2D").disabled = true
			else:
				i.get_node("front").set_animation("disque")
				i.get_node("Area2Dsenti/CollisionPolygon2D").disabled = false
		
	if miss == 0:
		$SHOOT.start(100000000)
	else:
		$SHOOT.paused = false
	for i in self.get_node("Node2D/Spikes").get_children():
		if "spik" in i.name:
			if spikus == 1:
				i.get_node("Area2Dspik/CollisionShape2D").disabled = false
				i.set_animation("pik")
			else:
				i.get_node("Area2Dspik/CollisionShape2D").disabled = true
				i.set_animation("default")
	$Downforce.set_volume_db(PlVar.music)
	for i in self.get_node("Node2D/PointsCages").get_children():
		if "Positionbas" in i.name:
			if get_node("Node2D/Cages/Boule"+ i.name[11] +"/soldier").lifboul < 5:
				i.global_position.x = get_node("Node2D/PointsCages/PositionsHaut/Position" + i.name[11]).global_position.x
				i.global_position.y = get_node("Node2D/PointsCages/PositionsHaut/Position" + i.name[11]).global_position.y + 500
	for i in self.get_node("Node2D/Cages").get_children():
		if "Boule" in i.name:
			if cage == 1:
				if i.global_position.y < get_node("Node2D/PointsCages/Positionbas" + i.name[5]).global_position.y:
					i.position.y += 30
				else:
					i.z_index = -2
					i.get_node("Terre").visible = true
					i.get_node("soldier/CollisionShape2D").disabled = false
					i.get_node("walls/CollisionShape2D").disabled = false
			if cage == 2:
				if i.global_position.y > get_node("Node2D/PointsCages/PositionsHaut/Position" + i.name[5]).global_position.y and i.get_node("soldier").lifboul < 5:
					i.position.y -= 30
				else:
					turncaj = 0
				if i.get_node("soldier").lifboul < 5:
					i.z_index = 0
					i.get_node("Terre").visible = false
					i.get_node("soldier/CollisionShape2D").disabled = true
					i.get_node("walls/CollisionShape2D").disabled = true
			if i.get_node("soldier").lifboul < 5 and cage == 0:
				i.global_position = get_node("Node2D/PointsCages/PositionsHaut/Position" + i.name[5]).global_position
			if i.get_node("soldier").lifboul >= 5:
				i.get_node("Cageback").animation = "used"
				for a in i.get_children():
					if "00010" in a.name:
						a.get_node("CollisionPolygon2D").disabled = false
				i.get_node("Cageback/Cage").visible = false
	if laser == 0:
		for i in self.get_node("Node2D/Eyes").get_children():
			if "eye" in i.name:
				if PlVar.bosslife <= 0:
					var b = particule.instance()
					b.global_position = i.global_position
					b.start(34, 1)
					$Node2D.add_child(b)
					i.queue_free()
				i.get_node("Eclat").modulate = Color(1, 1, 1, 0.1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = true
	elif laser == 7:
		for i in self.get_node("Node2D/Eyes").get_children():
			if "eye" in i.name:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = false
	elif laser == 8:
		for i in self.get_node("Node2D/Eyes").get_children():
			if "eye" in i.name and "2" in i.name or "4" in i.name or "6" in i.name:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = false
			if "eye" in i.name and "1" in i.name or "3" in i.name or "5" in i.name:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 0.1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = true
	elif laser == 9:
		for i in self.get_node("Node2D/Eyes").get_children():
			if "eye" in i.name and "2" in i.name or "4" in i.name or "6" in i.name:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 0.1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = true
			if "eye" in i.name and "1" in i.name or "3" in i.name or "5" in i.name:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = false
	else:
		for i in self.get_node("Node2D/Eyes").get_children():
			if "eye" in i.name and str(laser) != i.name[3]:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 0.1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = true
			if "eye" in i.name and str(laser) == i.name[3]:
				i.get_node("Eclat").modulate = Color(1, 1, 1, 1)
				i.get_node("Eclat/laser/Area2D/CollisionShape2D").disabled = false
			
	if nbsave == 4:
		get_node("Node2D/14263elec/0001426/CollisionShape2D").disabled = false
		get_node("Node2D/14263elec").visible = true
	pass


func _on_Area2D_body_entered(body):
	if "player" in body.name or "soldier" in body.name:
		 body.hit(rand_range(3.5, 8.5))
	pass # Replace with function body.


func _on_TEMPO_timeout():
	for i in self.get_node("Node2D/Eyes").get_children():
		if "eye" in i.name:
			i.rotation_degrees -= viteyes
	
	$Node2D/PointsSenti.rotation_degrees += 0.1
	if cage == 0:
		$Node2D/PointsCages/PositionsHaut.rotation_degrees += 0.1
	$TEMPO.start(0.0001)
	pass # Replace with function body.

func _on_MUSIC_timeout():
	if simp <= 7:
		$MUSIC.start(poslas[simp] - poslas[simp-1])
		laser += 1
		simp += 1
		if simp == 6 or simp == 7:
			cage = 1
			$cage.start(0.5)
	else:
		$MUSIC.start(100000000)
		laser = 0
		simp = 1
	pass # Replace with function body.


func _on_SUPSIC_timeout():
	if simper == 1:
		$Downforce.play()
		$SPIKES.paused = false
		$SPIKES.start(pospiks[spiker])
		$SHOOTER.paused = false
		$SHOOTER.start(posmis[misser])
		$SENTI.paused = false
		$SENTI.start(posent[semper][0])
		$DISK.paused = false
		$DISK.start(posdisk[disker])
		$SOLSPAWN.paused = false
		$SOLSPAWN.start(posol[soler])
	if simper <= 35:
		$SUPSIC.start(suposlas[simper] - suposlas[simper-1])
		simper += 1
		$MUSIC.paused = false
		laser = 0
		simp = 1
		$MUSIC.start(0.00000001)
		
	else:
		simper = 1
		spiker = 0
		misser = 0
		spikus = 0
		semper = 0
		disker = 0
		soler = 0
		vitsen = 0
		$SUPSIC.start(0.00000001)
	pass # Replace with function body.


func _on_MUSIC2_timeout():
	if simp2 <= 8:
		$MUSIC2.start(poslas2[simp2] - poslas2[simp2-1])
		if laser == 8:
			laser = 9
		else:
			laser = 8
		simp2+=1
	else:
		$MUSIC2.start(100000000)
		laser = 0
		simp2 = 1
	pass # Replace with function body.


func _on_SUPSIC2_timeout():
	if simper2 <= 10:
		$SUPSIC2.start(suposlas2[simper2] - suposlas2[simper2-1])
		simper2 += 1
		$MUSIC2.paused = false
		laser = 8
		simp2 = 1
		$MUSIC2.start(0.00000001)
		
	else:
		simper2 = 1
		$SUPSIC2.start(0.00000001)
	pass # Replace with function body.


func _on_Area2Dspik_body_entered(body):
	if "player" in body.name or "soldier" in body.name:
		 body.hit(rand_range(1.5, 2.5))
	pass # Replace with function body.


func _on_SPIKES_timeout():
	if spiker < 14:
		spiker += 1
		$SPIKES.start(pospiks[spiker] - pospiks[spiker-1])
		if spikus == 0:
			spikus = 1
		else:
			spikus = 0
	else:
		spikus = 0
		$SPIKES.start(100000000)
	pass # Replace with function body.


func _on_SHOOT_timeout():
	for i in self.get_node("Node2D/Holes").get_children():
		if "hole" in i.name:
			var b = proj.instance()
			b.global_position = i.global_position
			self.add_child(b)
	$SHOOT.start(6)
	pass # Replace with function body.


func _on_SHOOTER_timeout():
	if misser < 3:
		misser += 1
		$SHOOTER.start(posmis[misser] - posmis[misser-1])
		if miss == 0:
			miss = 1
			$SHOOT.paused = false
			$SHOOT.start(0.1)
		else:
			miss = 0
	else:
		miss = 0
		$SHOOTER.start(100000000)
	pass # Replace with function body.


func _on_SENTI_timeout():
	if semper < 21:
		vitsen = posent[semper][1]
		semper += 1
		$SENTI.start(posent[semper][0] - posent[semper-1][0])
	else:
		vitsen = 0
		$SENTI.start(100000000)
	pass # Replace with function body.
	pass # Replace with function body.


func _on_SENTMOV_timeout():
	for i in $Node2D/PointsSenti.get_children():
		i.position.x += vitsen
	$SENTMOV.start(0.01)
	pass # Replace with function body.


func _on_rayarea_body_entered(body):
	if "player" in body.name:
		 body.hit(rand_range(50.5, 60.5))
	pass # Replace with function body.


func _on_DISK_timeout():
	if disker < 3:
		disker += 1
		$DISK.start(posdisk[disker] - posdisk[disker-1])
		if disk == 0:
			disk = 1
		else:
			disk = 0
	else:
		disk = 0
		$DISK.start(100000000)
	pass # Replace with function body.


func _on_Area2Dsenti_body_entered(body):
	if "player" in body.name or "soldier" in body.name:
		 body.hit(rand_range(60.5, 80.5))
	pass # Replace with function body.

func move_pos():
	decide = rand_range(0, 1)
	if decide <= 0.5:
		$Node2D/solpos.position.x = rand_range(721, 1234)
	if decide > 0.5:
		$Node2D/solpos.position.x = rand_range(1788, 2336)
	decide = rand_range(0, 1)
	if decide <= 0.5:
		$Node2D/solpos.position.y = rand_range(830, 1860)
	if decide > 0.5:
		$Node2D/solpos.position.y = rand_range(920, 1727)
	pass

func _on_SOLPOS_timeout():
	if solspw == 1:
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
		move_pos()
	$SOLPOS.start(0.5)
	pass # Replace with function body.


func _on_SOLSPAWN_timeout():
	if soler < 1:
		soler += 1
		$SOLSPAWN.start(posol[soler] - posol[soler-1])
		if solspw == 0:
			solspw = 1
		else:
			solspw = 0
	else:
		solspw = 0
		$SOLSPAWN.start(100000000)
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_cage_timeout():
	if cage == 2:
		cage = 0
	if cage == 1:
		cage = 2
		$cage.start(0.3)
	pass # Replace with function body.


func _on_DIALOS_timeout():
	if currdial < dials[seldial][1]:
		currdial += 1
		PlVar.action(currdial)
		$DIALOS.start(PlVar.vitphac + 0.1)
	pass # Replace with function body.


func _on_DEATH_timeout():
	PlVar.life = PlVar.diffveg
	PlVar.mana = PlVar.manamax
	PlVar.sens = 0
	PlVar.perso = 0
	PlVar.cara = 0
	PlVar.nextmap = 15
	Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	pass # Replace with function body.
