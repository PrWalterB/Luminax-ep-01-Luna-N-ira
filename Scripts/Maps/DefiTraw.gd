extends Node
# warning-ignore:unused_class_variable
var c1 = [7,3,8,4,6,2,5,1]
# warning-ignore:unused_class_variable
var c2 = [1,2,3,4,5,6,7,8]
# warning-ignore:unused_class_variable
var c3 = [1,1,1,2,1,1,2,1,1,1,1,1,2,2,1,3,1,2,2,1,1,0]
# warning-ignore:unused_class_variable
var a1 = []
# warning-ignore:unused_class_variable
var a2 = []
# warning-ignore:unused_class_variable
var a3 = []
# warning-ignore:unused_class_variable
var b1 = []
# warning-ignore:unused_class_variable
var b2 = []
# warning-ignore:unused_class_variable
var b3 = []
var karma = 0
# warning-ignore:unused_class_variable
var dials = 0
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 15
	PlVar.chargement = 1
	PlVar.save_game()
	$Charge.start(1)
	PlVar.dialo = 1
	PlVar.phase = 1070
	var b = dialogb.instance()
	add_child(b)
	$Node2D/player.global_position = $Node2D/tp/c1.global_position
	karma = int(PlVar.scenario[8]) + int(PlVar.scenario[14]) + (int(PlVar.scenario[17]) - 2)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == 1087 or PlVar.phase == 1099 or PlVar.phase == 1109 or PlVar.phase == 1122 or PlVar.phase == 1127 or PlVar.phase == 1132:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 1089:
		$Node2D/PNJ.set_global_position(Vector2(-1000,-1000))
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
	if PlVar.phase == 1101:
		$Node2D/brouillard.modulate = Color(1,1,1,0.05)
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
	if PlVar.phase == 1111:
		$Node2D/brouillard.modulate = Color(1,1,1,0.16)
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase = 0
		PlVar.dialo = 0
	if PlVar.phase == 1124:
		$Node2D/brouillard.modulate = Color(1,1,1,0.80)
		$Node2D/player/Black2.fondu(-0.01, 1)
		if karma > 4:
			PlVar.phase = 1125
		else:
			PlVar.save_succ(17)
			PlVar.phase = 1130
		var b = dialogb.instance()
		add_child(b)
	
	if $EinsteinPuzzle.succeed == 5 and dials < 1:
		PlVar.phase = 1090
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 10 and dials < 2:
		PlVar.phase = 1095
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 15 and dials < 3:
		PlVar.phase = 1102
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 20 and dials < 4:
		PlVar.phase = 1105
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 25 and dials < 5:
		PlVar.phase = 1112
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 36 and dials < 6:
		PlVar.phase = 1114
		lauchdial()
		dials += 1
	if $EinsteinPuzzle.succeed == 42 and dials < 7:
#	if $EinsteinPuzzle.succeed == 1 and dials < 7:
		PlVar.phase = 1122
		lauchdial()
		dials += 1
#	if a1.size() > 0 and a1.size() != b1.size():
#		b1.append(c1[a1.size() - 1])
#		if b1 != a1:
#			a1 = []
#			b1 = []
#			for i in $Node2D/Buttons/c1.get_children():
#				i.active = 0
#		elif b1.size() == 4 and dials < 1:
#			PlVar.phase = 1090
#			lauchdial()
#			dials += 1
#		elif b1.size() == 8 and dials < 2:
#			PlVar.phase = 1095
#			lauchdial()
#			dials += 1
#	if a2.size() > 0 and a2.size() != b2.size():
#		b2.append(c2[a2.size() - 1])
#		if b2 != a2:
#			a2 = []
#			b2 = []
#			for i in $Node2D/Buttons/c2.get_children():
#				i.active = 0
#		elif b2.size() == 4 and dials < 3:
#			PlVar.phase = 1102
#			lauchdial()
#			dials += 1
#		elif b2.size() == 8 and dials < 4:
#			PlVar.phase = 1105
#			lauchdial()
#			dials += 1
#	if a3.size() > 0 and a3.size() != b3.size():
#		b3.append(c3[a3.size() - 1])
#		if b3 != a3:
#			a3 = []
#			b3 = []
#			for i in $Node2D/Buttons/c3.get_children():
#				i.active = 0
#		elif b2.size() == 11 and dials < 5:
#			PlVar.phase = 1112
#			lauchdial()
#			dials += 1
#		elif b2.size() == 8 and dials < 4:
#			PlVar.phase = 1114
#			lauchdial()
#			dials += 1
#	$Node2D/Ecrans/c1.texture = load("res://Sprites/Props/Black Moon/ecr_c2_" + str(b1.size()) + ".png")
#	$Node2D/Ecrans/c2.texture = load("res://Sprites/Props/Black Moon/ecr_c2_" + str(b2.size()) + ".png")
#	$Node2D/Ecrans/c3.texture = load("res://Sprites/Props/Black Moon/ecr_c3_" + str(b3.size()) + ".png")
	pass


func _on_Timer_timeout():
	if PlVar.phase == 1088 or PlVar.phase == 1100 or PlVar.phase == 1110 or PlVar.phase == 1123:
		PlVar.phase += 1
	if PlVar.phase == 1128 or PlVar.phase == 1133:
		PlVar.dialo = 0
		PlVar.phase = 0
		PlVar.mana = PlVar.manamax
		PlVar.life = PlVar.diffveg
		PlVar.nextmap = 18
		PlVar.nextx = 1424
		PlVar.nexty = 1350
		PlVar.sens = 1
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.cara = 0
		PlVar.caradeg = 0
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.

func lauchdial():
	PlVar.dialo = 1
	var b = dialogb.instance()
	add_child(b)
