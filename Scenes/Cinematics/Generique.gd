extends Node
var mov = 0
var karma = 0
var genelist
var genelistg
var backload
var mad_world = preload("res://Musiques/mad_world.wav")
var madphase = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map == 1024
	if PlVar.diffveg <= 50:
		PlVar.save_succ(24)
		if PlVar.diffveg <= 10:
			PlVar.save_succ(25)
			if PlVar.diffveg <= 0.1:
				PlVar.save_succ(26)
	if PlVar.diffpro >= 1.5:
		PlVar.save_succ(27)
		if PlVar.diffpro >= 2:
			PlVar.save_succ(28)
			if PlVar.diffpro >= 4:
				PlVar.save_succ(29)
	if PlVar.diffdou != 0:
		if PlVar.diffdou <= 7200:
			PlVar.save_succ(30)
			if PlVar.diffdou <= 3600:
				PlVar.save_succ(31)
				if PlVar.diffdou <= 1800:
					PlVar.save_succ(32)
	if PlVar.difftog != 0:
		if PlVar.difftog <= 50:
			PlVar.save_succ(33)
			if PlVar.difftog <= 10:
				PlVar.save_succ(34)
				if PlVar.difftog <= 1:
					PlVar.save_succ(35)
	if PlVar.diffdoo >= 1.5:
		PlVar.save_succ(36)
		if PlVar.diffdoo >= 2:
			PlVar.save_succ(37)
			if PlVar.diffdoo >= 4:
				PlVar.save_succ(38)
	if PlVar.diffveg <= 0.1 and PlVar.diffpro >= 4 and PlVar.difftog <= 1 and PlVar.diffdoo >= 4:
		PlVar.save_succ(39)
		if PlVar.diffdou <= 1800:
			PlVar.save_succ(40)
			if PlVar.zoom <= 0.2 and PlVar.rotate == 180 and PlVar.smooth <= 0.1:
				PlVar.save_succ(41)
	if PlVar.useveg == 1 and PlVar.usepro == 0 and PlVar.useddo == 0 and PlVar.usetog == 0:
		PlVar.save_succ(42)
	if PlVar.useveg == 0 and PlVar.usepro == 1 and PlVar.useddo == 0 and PlVar.usetog == 0:
		PlVar.save_succ(43)
	if PlVar.useveg == 0 and PlVar.usepro == 0 and PlVar.useddo == 1 and PlVar.usetog == 0:
		PlVar.save_succ(44)
	if PlVar.useveg == 0 and PlVar.usepro == 0 and PlVar.useddo == 0 and PlVar.usetog == 1:
		PlVar.save_succ(45)
	if PlVar.rotate == 180:
		PlVar.save_succ(46)
	if PlVar.zoom <= 0.2:
		PlVar.save_succ(47)
	if PlVar.smooth <= 0.1:
		PlVar.save_succ(48)
	
	
	PlVar.get_node("Ambiance").stream_paused = true
	PlVar.get_node("Musique").stream_paused = false
	backload = PlVar.get_gui_lang()
	genelist = backload[64].rsplit(";")
	genelistg = backload[83].rsplit(";")
	for i in genelist:
		i = i.replace("\\n","\n")
	for i in genelistg:
		i = i.replace("\\n","\n")
	$Node/Label13.text = genelist[0]
	var r = 1
	for i in genelistg:
		get_node("Node/Label" + str(r)).text = i
		r += 1
	$Timer2.start(15)
	$Timer3.start(30)
	$Mov.start(1)
	$Timer.start(2.541)
	PlVar.get_node("Musique").stream_paused = true
	karma = int(PlVar.scenario[8]) + int(PlVar.scenario[14]) + (int(PlVar.scenario[17]) - 2)
#	karma = 5
	if karma < 5:
		$Node2D/player.global_position = Vector2(795,135)
		$EndMus.stream = mad_world
	else:
		$Node2D/player.global_position = Vector2(230,135)
	$EndMus.play()
	PlVar.dialo = 1
	$Node2D/player.z_index = -20
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlVar.zoom = 0.45
	if ($Node.global_position.y <= -3400 or $Node/badend.global_position.y >= -6) and mov != 2:
		mov = 2
		if karma < 5:
			$Node2D/player/Black2.fondu(0.005, 0, 1)
			$Timer2.start(6)
		else:
			$Node2D/player/Black2.fondu(0.01, 0)
			$Timer2.start(3)
	pass


func _on_Timer_timeout():
	if mov != 2:
		mov = 1
	pass # Replace with function body.


func _on_Mov_timeout():
	if mov == 1:
		if karma < 5:
			$Node/badend.global_position.y += 0.0751666*PlVar.uldelta
		else:
			$Node.global_position.y -= 0.2867*PlVar.uldelta
	$Mov.start(0.01)
	pass # Replace with function body.


func _on_Timer2_timeout():
	$Node/Veget.text = "M."
	$Node/Doubliks.text = "N."
	$Node/Progfer.text = "A."
	if mov == 2:
		if karma >= 5:
			Omni.goto_scene("res://Scenes/Maps/Gentilis.tscn")
		else:
			PlVar.dialo = 0
			PlVar.reset_game()
	pass # Replace with function body.


func _on_Timer3_timeout():
	if madphase < 9:
		madphase += 1
		$Timer3.start(30)
		$Node/Label13.text = genelist[madphase]
	else:
		$Node/Label13.text = ""
	pass # Replace with function body.
