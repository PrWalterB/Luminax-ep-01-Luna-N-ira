extends Node2D

# warning-ignore:unused_class_variable
var gui
var player_pos = Vector2(0,0)
# warning-ignore:unused_class_variable
var player
# warning-ignore:unused_class_variable
var messf = ""
var sens = 0
var lang = "fr"
var perso = 0
var life = 100
# warning-ignore:unused_class_variable
var bosslife = 400
# warning-ignore:unused_class_variable
var maxbosslife = 400
var mana = 100
var caradeg = 0
var cara = 0
# warning-ignore:unused_class_variable
var retoorn = 0
var map = 0
var nextx = 47
var nexty = 11
var nextmap = 0
# warning-ignore:unused_class_variable
var vel
var dialo = 0
var phase = 0
var allow = 0
var pause = 0
var zoom = 0.45
# warning-ignore:unused_class_variable
var mort = 0
# warning-ignore:unused_class_variable
var animation = 0
var rotate = 0
var smooth = 10
var scenario = "00000000000000000000000000"
var deblock = "10000"
var succes = "000000000000000000000000000000000000000000000000000000"
var succment = -1
var last = "0123"
var guide = 1
var censor = 0
var sauv = "47|11|100|100|0|-2|0|0|00000000000000000000000000|10000|100|1|0|0|1|0|0|0|0|0|0|0|0"
#Difficultées
var diffveg = 100
var diffpro = 1
var diffdou = 0
var diffdoo = 1
var difftog = 0
var manamax = 100

var useveg = 0
var usepro = 0
var useddo = 0
var usetog = 0

var pausemenu = preload("res://Scenes/Other/Pause.tscn")
var infomenu = preload("res://Scenes/Other/StarMenu.tscn")
var helpmenu = preload("res://Scenes/Other/HelpMenu.tscn")
var actiongb = preload("res://Scenes/Other/ActionBox.tscn")
var music0 = preload("res://Musiques/Town of Broken Hearts.wav")
var music1 = preload("res://Musiques/Morning.wav")
var music2 = preload("res://Musiques/combat_confirmer.wav")
var music3 = preload("res://Musiques/herd_girls.wav")
var music4 = preload("res://Musiques/march_trolls.wav")
var music5 = preload("res://Musiques/symphonic_dance.wav")
var music6 = preload("res://Musiques/bridal_procession.wav")
var music7 = preload("res://Musiques/progfer_with_dual_tec9_begin.wav")
var music7l = preload("res://Musiques/progfer_with_dual_tec9_loop.wav")
var music8 = preload("res://Musiques/trembl.wav")
var music9 = preload("res://Musiques/hunted_trolls_begin.wav")
var music9l = preload("res://Musiques/hunted_trolls_loop.wav")
var music10 = preload("res://Musiques/mountain_girl.wav")
var music11 = preload("res://Musiques/day_sun.wav")
var music12 = preload("res://Musiques/tec9.wav")
var music13 = preload("res://Musiques/funeral_march.wav")
var music14 = preload("res://Musiques/queens_garden.wav")
var music15 = preload("res://Musiques/you_me.wav")
var music16 = preload("res://Musiques/impossible_remix.wav")
var music17 = preload("res://Musiques/invaders.wav")
var music18 = preload("res://Musiques/arabian_dance.wav")
var music19 = preload("res://Musiques/pine_forest.wav")
var music20 = preload("res://Musiques/norvegian_dance_begin.wav")
var music20l = preload("res://Musiques/norvegian_dance_loop.wav")
var music21 = preload("res://Musiques/cradle_song.wav")
var music22 = [preload("res://Musiques/moutain_king_0.wav"),preload("res://Musiques/moutain_king_1.wav"),preload("res://Musiques/moutain_king_2.wav"),preload("res://Musiques/moutain_king_3.wav"),preload("res://Musiques/moutain_king_4.wav"),preload("res://Musiques/moutain_king_5.wav"),preload("res://Musiques/moutain_king_6.wav")]
var music23 = preload("res://Musiques/solveig_song.wav")
var music24 = preload("res://Musiques/mountain_king_begin.wav")
var music24l = preload("res://Musiques/moutain_king.wav")
var music25 = preload('res://Sons/Ambiance_Monodecol.wav')
var amb1 = preload("res://Sons/Ambiance_Champ.wav")
var ambspa = preload("res://Sons/Ambiance_Space.wav")
var amb5 = preload("res://Sons/Ambiance_Jupiter.wav")
var amb7 = preload("res://Sons/Ambiance_BOSS1.wav")
var amb13 = preload("res://Sons/Ambiance_Sun.wav")
var amb14 = preload("res://Sons/Ambiance_Cygio.wav")
var amb18 = preload("res://Sons/Ambiance_Pluto.wav")
var amb20 = preload("res://Musiques/queens_garden.wav")
var keltraw = 0
# warning-ignore:unused_class_variable
var machindo = 0
var menutime = 0
var firstime = 0
var kelmus = 0
var secondes = 0
var minutes = 0
var heures = 0
var temps = 0
var vies = 0
# warning-ignore:unused_class_variable
var chargement = 0
var kill = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var music = -2
var son = -15
# warning-ignore:unused_class_variable
var nbcara = 0
var tuto = 0
var phaction = 0
# warning-ignore:unused_class_variable
var pp
# warning-ignore:unused_class_variable
var chara
# warning-ignore:unused_class_variable
var vitphac = 0
var locscen = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
var loop = 0
var ambloop = 0
var transloop = 25
#RSS
var rsstitle = []
var rssdesc = []
var rssfdesc = []
var rsslink = []

# warning-ignore:unused_class_variable
var i = 0
var ding = 0

var uldelta = 1
var gdelta = 0.016667

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request("https://luminax.868center.tech/rss.xml")
	print(OS.get_locale())
	load_cfg()
	load_succ()
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.lisa"):
		save_game.open("user://savegame.lisa", File.WRITE)
		save_game.store_line(sauv)
		save_game.close()
		tuto = 1
		print("ouais")
		if OS.get_locale() in ["fr_FR", "fr_BE", "fr_CA", "fr_CH", "fr_LU", "fr_MC"]:
			lang = "fr"
		else:
			lang = "en"
		print("Ready for epic gaming moments")
	var succ_game = File.new()
	if not succ_game.file_exists("user://succ.lisa"):
		succ_game.open("user://succ.lisa", File.WRITE)
		succ_game.store_line(succes)
		succ_game.close()
	load_input()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	uldelta = 60*delta
	gdelta = delta
	if manamax == 200:
		PlVar.save_succ(21)
	if diffdou != 0:
		if temps >= diffdou:
			PlVar.reset_game()
	if pause == 0:
		$Defi.paused =  false
		$CLC.paused = false
	if pause == 1:
		$Defi.paused =  true
		$CLC.paused = true
	if map == 20:
		$Musique.set_volume_db(music-15)
	if map == 7:
		$Musique.set_volume_db(music-5)
	elif kelmus == 24:
		$Musique.set_volume_db(music - 10 + (20 - (bosslife/100)))
	elif (kelmus >= 5 and kelmus < 7) or kelmus == 12 or (kelmus == 15 and map == 10) or kelmus == 17 or kelmus == 23:
		$Musique.set_volume_db(music-10)
	elif (kelmus == 15 and map == 11):
		$Musique.set_volume_db(music-20)
	elif kelmus == 14:
		$Musique.set_volume_db(music-10)
	elif kelmus == 16 or kelmus == 13:
		$Musique.set_volume_db(music-10)
	elif kelmus == 4 or kelmus == 10:
		$Musique.set_volume_db(music+5)
	elif kelmus == 2 or kelmus == 3 or kelmus == 19:
		$Musique.set_volume_db(music+5)
	else:
		$Musique.set_volume_db(music-transloop)
	$Play.set_volume_db(music)
	$Clic.set_volume_db(son + 15)
	if map == 5:
		$Ambiance.set_volume_db(son)
	elif map >= 18 and map != 20:
		$Ambiance.set_volume_db(son-10)
	elif map == 3:
		$Ambiance.set_volume_db(son-5)
	else:
		$Ambiance.set_volume_db(son+10)
	if (map >= 0 and map <= 6 and kelmus != 9) or PlVar.map == 8 or ((PlVar.map >= 10 and PlVar.map <= 13) and not (kelmus == 20 and PlVar.map == 12)) or PlVar.map >= 18 and PlVar.map != 19 and PlVar.map != 20:
		if loop == 0:
			loop = 1
			if kelmus == 1:
				$Musique.stream = music1
			if kelmus == 0:
				$Musique.stream = music0
			if kelmus == 2:
				$Musique.stream = music2
			if kelmus == 3:
				$Musique.stream = music3
			if kelmus == 4:
				$Musique.stream = music4
			if kelmus == 5:
				$Musique.stream = music5
			if kelmus == 6:
				$Musique.stream = music6
			if kelmus == 8:
				$Musique.stream = music8
			if kelmus == 10:
				$Musique.stream = music10
			if kelmus == 11:
				$Musique.stream = music11
			if kelmus == 12:
				$Musique.stream = music12
			if kelmus == 13:
				$Musique.stream = music13
			if kelmus == 14:
				$Musique.stream = music14
			if kelmus == 15:
				$Musique.stream = music15
			if kelmus == 16:
				$Musique.stream = music16
			if kelmus == 17:
				$Musique.stream = music17
			if kelmus == 18:
				$Musique.stream = music18
			if kelmus == 19:
				$Musique.stream= music19
			if kelmus == 21:
				$Musique.stream = music21
			if kelmus == 22:
				$Musique.stream = music22[keltraw]
			if kelmus == 23:
				$Musique.stream = music23
			if kelmus == 25:
				$Musique.stream = music25
			$Musique.play()
			$TransLoop.start(0.01)
	elif map == 7 or map == 20:
		if loop == 0:
			loop = 1
			$Musique.stream = music7
			$Musique.play()
			$TransLoop.start(0.01)
	elif map == 5 and kelmus == 9:
		if loop == 0:
			loop = 1
			$Musique.stream = music9
			$Musique.play()
			$TransLoop.start(0.01)
	elif map == 12 and kelmus == 20:
		if loop == 0:
			loop = 1
			$Musique.stream = music20
			$Musique.play()
			$TransLoop.start(0.01)
	elif kelmus == 24 and PlVar.map == 19:
		if loop == 0:
			loop = 1
			$Musique.stream = music24
			$Musique.play()
			$TransLoop.start(0.01)
	else:
		$Musique.stop()
		loop = 0
		transloop = 25
	
	if map == 1:
		if ambloop == 0:
			$Ambiance.stream = amb1
			$Ambiance.play()
			ambloop = 1
	elif map == 3:
		if ambloop == 0:
			$Ambiance.stream = ambspa
			$Ambiance.play()
			ambloop = 1
	elif map == 5:
		if ambloop == 0:
			$Ambiance.stream = amb5
			$Ambiance.play()
			ambloop = 1
	elif map == 7:
		if ambloop == 0:
			$Ambiance.stream = amb7
			$Ambiance.play()
			ambloop = 1
	elif map == 13:
		if ambloop == 0:
			$Ambiance.stream = amb13
			$Ambiance.play()
			ambloop = 1
	elif map == 14:
		if ambloop == 0:
			$Ambiance.stream = amb14
			$Ambiance.play()
			ambloop = 1
	elif (map >= 18 and map != 20) or map == 15:
		if ambloop == 0:
			$Ambiance.stream = amb18
			$Ambiance.play()
			ambloop = 1
	elif map == 20:
		if ambloop == 0:
			$Ambiance.stream = amb20
			$Ambiance.play()
			ambloop = 1
	else:
		$Ambiance.stop()
		ambloop = 0
	if map != 20:
		$Ambiance.pitch_scale = 1
	else:
		$Ambiance.pitch_scale = 0.4
	
	if map == 5:
		if PlVar.kill[3] == 1:
			if phaction != 13:
				PlVar.action(13)
			else:
				kill[3] += 1
		if PlVar.kill[3] == 3:
			if phaction != 14:
				PlVar.action(14)
			else:
				kill[3] += 1
		if PlVar.kill[3] == 5:
			if phaction != 15:
				PlVar.action(15)
			else:
				kill[3] += 1
		if PlVar.kill[3] == 7:
			if phaction != 16:
				PlVar.action(16)
			else:
				kill[3] += 1


	if PlVar.mana > PlVar.manamax:
		mana = PlVar.manamax
	if PlVar.mana < 0:
		mana = 0
	if PlVar.life > diffveg:
		PlVar.life = diffveg
	last[0] = str(perso)
	if OS.is_window_fullscreen() == false:
		var winsize = Vector2()
		winsize.x = 1024
		winsize.y = 600
		OS.set_window_size(winsize)
	
	if Input.is_action_pressed("pause"):
		if PlVar.map != -2:
			if dialo == 0:
				if pause == 0:
					if menutime == 0:
						pause = 1
						var b = pausemenu.instance()
						get_parent().add_child(b)
						$TimerMenu.start(0.5)
				if pause == 1:
					if menutime == 1:
						pause = 0
						$TimerMenu.start(0.5)
	
	if Input.is_action_pressed("info") or Input.is_action_pressed("help"):
		if PlVar.map != -2:
			if dialo == 0:
				if pause == 0:
					if menutime == 0:
						if PlVar.map != -1 and PlVar.map != 3 and PlVar.map != -2:
							pause = 1
							if Input.is_action_pressed("info"):
								var b = infomenu.instance()
								get_parent().add_child(b)
								$TimerMenu.start(0.5)
							if Input.is_action_pressed("help"):
								var b = helpmenu.instance()
								get_parent().add_child(b)
								$TimerMenu.start(0.5)
				if pause == 1:
					if menutime == 1:
						pause = 0
						$TimerMenu.start(0.5)
	if dialo == 0:
		if pause == 0:
			if cara == 0:
				if perso != -100:
					if deblock[0] == "1":
						if Input.is_action_pressed("selveget"):
							if perso != 0:
								PlVar.last = "0123"
							perso = 0
					if deblock[1] == "1":
						if Input.is_action_pressed("selprogfer"):
							if perso != 1:
								PlVar.last = "1023"
							perso = 1
							if PlVar.tuto == 4:
								PlVar.tuto = 0
					if deblock[2] == "1" and deblock[4] == "1":
						if Input.is_action_pressed("seldoub"):
							if perso != 2:
								PlVar.last = "2013"
							perso = 2
					if deblock[3] == "1":
						if Input.is_action_pressed("seltog") and (int(scenario[14]) + int(scenario[15])) != 2 :
							if perso != 3:
								PlVar.last = "3012"
							perso = 3
	if phase != 200 or phase != 201:
		if dialo == 2:
			if allow == 0:
				dialo = 0
				allow = 1
				$Timer.start(0.5)
	else:
		dialo = 1
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if ding != 1 and event.pressed and diffveg == 200 and diffdoo == 0.5 and diffpro == 0.5 and diffdou == 0 and difftog == 0 and PlVar.map != 1024:
			$CLC.start(300)
	pass

func save_game():
	if life <= 0:
		life = 10
	var save_game = File.new()
	save_game.open("user://savegame.lisa", File.WRITE)
	save_game.store_line(str(player_pos.x)+ "|"+str(player_pos.y)+ "|"+ str(life)+ "|"+ str(mana)+ "|"+ str(caradeg)+ "|"+ str(map)+"|"+ str(perso)+"|"+ str(sens) + "|" + scenario + "|" + deblock + "|" + str(diffveg) + "|" + str(diffpro) + "|" + str(diffdou) + "|" + str(difftog) + "|" + str(diffdoo) + "|" + str(temps) + "|" + str(vies) + "|" + str(censor) + "|" + str(manamax) + "|" + str(ding) + "|" + str(useveg) + "|" + str(usepro) + "|" + str(useddo) + "|" + str(usetog))
	save_game.close()

func load_game():
	print("Hey Brumen ! G")
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.lisa"):
		save_game.open("user://savegame.lisa", File.WRITE)
		save_game.store_line(sauv)
		save_game.close()
		print("No Brumen !")
	save_game.open("user://savegame.lisa", File.READ)
	var backload = save_game.get_line().rsplit("|")
	if backload[5] == "-2":
		Omni.goto_scene("res://Scenes/Other/Cinematic2.tscn")
	else:
		$Play.play()
		nextmap = int(backload[5])
		player_pos.x = float(backload[0])
		player_pos.y = float(backload[1])
		nextx = float(backload[0])
		nexty = float(backload[1])
		life = float(backload[2])
		mana = float(backload[3])
		caradeg = float(backload[4])
		perso = int(backload[6])
		sens = int(backload[7])
		scenario = backload[8]
		deblock = backload[9]
		if backload.size() >= 24:
			diffveg = float(backload[10])
			diffpro = float(backload[11])
			diffdou = int(backload[12])
			difftog = int(backload[13])
			diffdoo = float(backload[14])
			temps = float(backload[15])
			vies = float(backload[16])
			secondes = temps - int(temps/60)
			minutes = int(temps/60) - int(temps/3600)
			heures = int(temps/3600)
			censor = float(backload[17])
			manamax = float(backload[18])
			ding = int(backload[19])
			useveg = int(backload[20])
			usepro = int(backload[21])
			useddo = int(backload[22])
			usetog = int(backload[23])
		else:
			if backload.size() >= 19:
				diffveg = float(backload[10])
				diffpro = float(backload[11])
				diffdou = int(backload[12])
				difftog = int(backload[13])
				diffdoo = float(backload[14])
				temps = float(backload[15])
				vies = float(backload[16])
				secondes = temps - int(temps/60)
				minutes = int(temps/60) - int(temps/3600)
				heures = int(temps/3600)
				censor = float(backload[17])
				manamax = float(backload[18])
			else:
				var game = File.new()
				game.open("user://savegame.lisa", File.WRITE)
				game.store_line(str(nextx)+ "|"+str(nexty)+ "|"+ str(life)+ "|"+ str(mana)+ "|"+ str(caradeg)+ "|"+ str(nextmap)+"|"+ str(perso)+"|"+ str(sens) + "|" + scenario + "|" + deblock + "|" + str(diffveg) + "|" + str(diffpro) + "|" + str(diffdou) + "|" + str(difftog) + "|" + str(diffdoo) + "|" + str(temps) + "|" + str(vies) + "|" + str(censor) + "|" + str(manamax) + "|" + str(ding) + "|" + str(useveg) + "|" + str(usepro) + "|" + str(useddo) + "|" + str(usetog))
				game.close()
				load_game()
			var game = File.new()
			game.open("user://savegame.lisa", File.WRITE)
			game.store_line(str(nextx)+ "|"+str(nexty)+ "|"+ str(life)+ "|"+ str(mana)+ "|"+ str(caradeg)+ "|"+ str(nextmap)+"|"+ str(perso)+"|"+ str(sens) + "|" + scenario + "|" + deblock + "|" + str(diffveg) + "|" + str(diffpro) + "|" + str(diffdou) + "|" + str(difftog) + "|" + str(diffdoo) + "|" + str(temps) + "|" + str(vies) + "|" + str(censor) + "|" + str(manamax) + "|" + str(ding) + "|" + str(useveg) + "|" + str(usepro) + "|" + str(useddo) + "|" + str(usetog))
			game.close()
			load_game()
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
		print("Hey Brumen ! H")
	save_game.close()
	print("Hadoclat, nique ta mère.")


func _on_Timer_timeout():
	allow = 0
	pass # Replace with function body.


func _on_TimerMenu_timeout():
	if pause == 1:
		if menutime == 0:
			menutime = 1
	if pause == 0:
		if menutime == 1:
			menutime = 0
	pass # Replace with function body.

func load_config():
	var config = ConfigFile.new()
	var err = config.load("user://user.conf")
	if err:
		for action_name in [ "ui_up", "ui_down", "ui_left", "ui_right"]:
			var action_list = InputMap.get_action_list(action_name)
			var scancode = OS.get_scancode_string(action_list[0].scancode)
			config.set_value("input", action_name, scancode)
		config.save("user://user.conf")
	else:
		for action_name in config.get_section_keys("input"):
			var scancode = OS.find_scancode_from_string(config.get_value("input", action_name))
			var event = InputEventKey.new()
			event.scancode = scancode
			for old_event in InputMap.get_action_list(action_name):
				if old_event is InputEventKey:
					InputMap.action_erase_event(action_name, old_event)
			InputMap.action_add_event(action_name, event)


func save_to_config(section, key, value):
	"""Helper function to redefine a parameter in the settings file"""
	var config = ConfigFile.new()
	var err = config.load("user://user.conf")
	if err:
		print("Error code when loading config file: ", err)
	else:
		config.set_value(section, key, value)
		config.save("user://user.conf")
		
func get_gui_lang():
	var save_lang= File.new()
	if not save_lang.file_exists("res://Languages/"+ PlVar.lang +"gui.tres"):
		print("error")
		return # Error! We don't have a save to load.
	save_lang.open("res://Languages/"+ PlVar.lang +"gui.tres", File.READ)
	var backload = save_lang.get_line().rsplit("|")
	var backfin = []
	var message = ""
	var i2 = 0
	for i in backload:
		message = backload[i2]
		var messagesplit = message.rsplit("\\n")
		message = ""
		for i in messagesplit:
			message = message + i + "\n"
		backfin.append(message)
		i2 += 1
	return backfin

func save_cfg():
	var save_cfg = File.new()
	save_cfg.open("user://user.licfg", File.WRITE)
	save_cfg.store_line(str(firstime) + "|" + lang + "|" + str(zoom) + "|" + str(OS.is_window_fullscreen()) + "|" + str(music) + "|" + str(son) + "|" + str(rotate) + "|" + str(smooth) + "|" + str(guide))
	save_cfg.close()

func load_cfg():
	var save_cfg= File.new()
	if not save_cfg.file_exists("user://user.licfg"):
		PlVar.save_cfg()
		return # Error! We don't have a save to load.
	save_cfg.open("user://user.licfg", File.READ)
	var backload = save_cfg.get_line().rsplit("|")
	zoom = float(backload[2])
	music = float(backload[4])
	son = float(backload[5])
	rotate = float(backload[6])
	smooth = float(backload[7])
	guide = int(backload[8])
	if backload[3] == "True":
		OS.set_window_fullscreen(true)
	else:
		OS.set_window_fullscreen(false)
		
	firstime = 1
	save_cfg()

func save_succ(numero):
	if numero != -1:
		if succes[numero] == "0":
			print(succes[numero])
			succes[numero] = "1"
			PlVar.succment = numero
			$Timer2.start(5)
	var save_succ = File.new()
	save_succ.open("user://succ.lisa", File.WRITE)
	save_succ.store_line(succes)
	save_succ.close()

func load_succ():
	var primo = succes.length()
	var save_succ = File.new()
	if not save_succ.file_exists("user://succ.lisa"):
		save_succ(-1)
		return # Error! We don't have a save to load.
	save_succ.open("user://succ.lisa", File.READ)
	succes = save_succ.get_line()
	while succes.length() < primo:
		succes += "0"
	save_succ(-1)

func save_input():
	var save_cfg = File.new()
	if not save_cfg.file_exists("user://user.linput"):
		return
	else:
		save_cfg.open("user://user.linput", File.WRITE)
		for i in InputMap.get_actions():
			if InputMap.get_action_list(i)[0] is InputEventKey:
				save_cfg.store_line(str(i) + "|" + str(InputMap.get_action_list(i)[0].get_scancode()) + "|KEY")
			if InputMap.get_action_list(i)[0] is InputEventMouseButton:
				save_cfg.store_line(str(i) + "|" + str(InputMap.get_action_list(i)[0].get_button_index()) + "|MOUSE")
		save_cfg.close()

func load_input():
	var save_cfg= File.new()
	if not save_cfg.file_exists("user://user.linput"):
		var model = File.new()
		var fmodel = []
		model.open("res://input.tres", File.READ)
		while not model.eof_reached():
			var current_line = model.get_line()
			fmodel.append(current_line)
		fmodel.pop_back()
		save_cfg.open("user://user.linput", File.WRITE)
		for i in fmodel:
			print(i)
			save_cfg.store_line(i)
		save_cfg.close()
		load_input()
		return # Error! We don't have a save to load.
	save_cfg.open("user://user.linput", File.READ)
	var backload = []
	while not save_cfg.eof_reached():
		var current_line = save_cfg.get_line().rsplit("|")
		backload.append(current_line)
# warning-ignore:shadowed_variable
	backload.pop_back()
	var caca = "ui_cancel"
	for i in backload:
#		print(i)
#		print("groscaca")
		var i0 = i[0]
		var i1 = i[1]
		var i2 = i[2]
		if i0 in caca:
			print("prout")
		else:
			if i2 == "KEY" and str(i0) != "EVENTKEY" and i0 != "ui_cancel":
				InputMap.get_action_list(i0)[0].set_scancode(int(i1))
				InputMap.action_erase_event(i0, InputMap.get_action_list(i0)[1])
			if i2 == "MOUSE" and str(i0) != "EVENTMOUSE" and i0 != "ui_cancel":
				InputMap.get_action_list(i0)[1].set_button_index(int(i1))
				InputMap.action_erase_event(i0, InputMap.get_action_list(i0)[0])
		caca += i0

func action(nb):
	if PlVar.pause == 0 or (nb >=63 and nb <71):
		if PlVar.dialo == 0:
			if PlVar.mort == 0:
				if PlVar.phaction == 0:
					if locscen[nb] == "0":
						PlVar.phaction = nb
						var ba = actiongb.instance()
						get_parent().add_child(ba)
						locscen[nb] = "1"
					
	pass

func reset_game():
	var save_game = File.new()
	save_game.open("user://savegame.lisa", File.WRITE)
	save_game.store_line(sauv)
	save_game.close()
	mort = 0
	dialo = 0
	phase = 0
	phaction = 0
	player_pos.x = 47
	player_pos.y = 11
	life = 100
	mana = 100
	caradeg = 0
	perso = 0
	sens = 0
	scenario = "00000000000000000000000000"
	deblock = "10000"
	locscen = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	diffveg = 100
	diffpro = 1
	diffdou = 0
	difftog = 1
	diffdoo = 0
	temps = 0
	vies = 0
	secondes = 0
	minutes = 0
	heures = 0
	manamax = 100
	ding = 0
	useveg = 0
	usepro = 0
	useddo = 0
	usetog = 0
	nextmap = 0
	nextx = 47
	nexty = 11
	firstime = 1
	save_cfg()
	pause = 0
	Omni.goto_scene("res://Scenes/Other/Menu.tscn")
	pass

func _on_AudioStreamPlayer_finished():
	if loop == 1:
		$Musique.play()
		loop = 2
	if loop == 2:
		if (map >= 0 and map <= 6 and kelmus != 9) or PlVar.map == 8 or ((PlVar.map >= 10 and PlVar.map <= 13) and not (kelmus == 20 and PlVar.map == 12)) or PlVar.map >= 18 and PlVar.map != 19 and PlVar.map != 20:
			$Musique.play()
		elif map == 7 or map == 20:
			$Musique.stream = music7l
			$Musique.play()
		elif map == 5 and kelmus == 9:
			$Musique.stream = music9l
			$Musique.play()
		elif map == 12 and kelmus == 20:
			$Musique.stream = music20l
			$Musique.play()
		elif kelmus == 24 and map == 19:
			$Musique.stream = music24l
			$Musique.play()
		else:
			pass
	pass # Replace with function body.


func _on_TransLoop_timeout():
	if transloop > 0:
		transloop -= 0.5*PlVar.uldelta
		$TransLoop.start(0.1)
	pass # Replace with function body.


func _on_Ambiance_finished():
	if ambloop == 1:
		$Ambiance.play()
	pass # Replace with function body.

func clic(type):
	$Clic.stream = load("res://Sons/Clic_" + str(type) + ".wav")
	$Clic.play()
	pass


func _on_Timer2_timeout():
	PlVar.succment = -1
	pass # Replace with function body.


func _on_Defi_timeout():
	if secondes < 59:
		secondes += 1
	else:
		minutes += 1
		secondes = 0
	if minutes == 60:
		heures += 1
		minutes = 0
	temps += 1
	$Defi.start(1)
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
#	$TextEdit.set_text(body.get_string_from_utf8())
	var p = XMLParser.new()
	var in_item_node = false
	var in_title_node = false
	var in_description_node = false
	var in_link_node = false
	var isnew = []
	var backdials = []
	
	p.open_buffer(body)
	while p.read() == OK:
		var node_name = p.get_node_name()
		var node_data = p.get_node_data()
		var node_type = p.get_node_type()
		
		if node_name == "item":
			in_item_node = !in_item_node
		if node_name == "title":
			in_title_node = !in_title_node
			continue
		if node_name == "description":
			in_description_node = !in_description_node
			continue
		if node_name == "guid":
			in_link_node = !in_link_node
			continue
		if(in_description_node == true):   
#		   print("description-data" + node_data)   
		   if(node_data != ""):    
			  rssdesc.append(node_data)   
		   else:    
#		      print("description:" + node_name)       
			  rssdesc.append(node_name)    
		if(in_title_node == true):   
#		   print("Title-data:"+ node_data)   
		   if(node_data !=""):    
			  rsstitle.append(node_data)   
		   else:    
#		      print("Title:" + node_name)    
			  rsstitle.append(node_name)   
		if(in_link_node == true):   
#		   print("link-desc" + node_data)   
		   if(node_data != ""):    
			  rsslink.append(node_data)   
		   else:    
#		      print("link" + node_name)    
			  rsslink.append(node_name)
	for i in rssdesc:
		i = i.replace("<h1>","")
		i = i.replace("</h1>","")
		i = i.replace("<p>","")
		i = i.replace("</p>","")
		i = i.replace("<h2>","")
		i = i.replace("</h2>","")
		i = i.replace("<h3>","")
		i = i.replace("</h3>","")
		i = i.replace("<h4>","")
		i = i.replace("</h4>","")
		i = i.replace("</br>","")
		i = i.replace("<a href=","")
		i = i.replace("</a>","")
		i = i.replace(">","")
		rssfdesc.append(i)
		isnew.append("1")
#	print("Titles: ")
	rsstitle.pop_front()
	rssfdesc.pop_front()
	isnew.pop_front()
	
	var save_rss = File.new()
	if save_rss.file_exists("user://user.lss"):
		backdials = load_rss()
		var i = 0
		while i < isnew.size():
			if i >= rsstitle.size() - backdials.size():
				if i - (rsstitle.size() - backdials.size()) >= 0:
					if backdials[i - (rsstitle.size() - backdials.size())][0] == "0":
						isnew[i] = "0"
			i += 1
				
#	if not save_rss.file_exists("user://user.lss/"):
#		return # Error! We don't have a save to load.
	save_rss.open("user://user.lss", File.WRITE)
	var i2 = 0
	while i2 < rsstitle.size():
		save_rss.store_line(isnew[i2] + "|" + rsstitle[i2] + "|" + rsslink[i2] + "|" + rssfdesc[i2].replace("\n","\\n"))
		i2 += 1
	save_rss.close()
	pass # Replace with function body.

func load_rss():
	var rss = File.new()
	var backdials = []
	if not rss.file_exists("user://user.lss"):
		var save_rss = File.new()
		save_rss.open("user://user.lss", File.WRITE)
		save_rss.store_line("1|Bienvenue sur Luminax ! - Welcome on Luminax !|https://luminax.868center.tech/2021.html#bienvenue-sur-luminax-welcome-on-luminax|Le Blog de Luminax est ouvert ! The Luminax's Blog is open !")
		save_rss.close()
	rss.open("user://user.lss", File.READ)
	while not rss.eof_reached():
		var current_line = rss.get_line().replace("\\n","\n").rsplit("|")
		backdials.append(current_line)
	backdials.pop_back()
	return backdials
	pass


func _on_CLC_timeout():
	$CasseLesCouilles.play()
	ding = 1
	PlVar.save_succ(50)
	$CLC.start(rand_range(0.5,3))
	pass # Replace with function body.
