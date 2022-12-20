extends CanvasLayer
var visi = 0
var v = preload("res://Sprites/GUI/sprite225_0.png")
var p = preload("res://Sprites/GUI/sprite226_0.png")
var d1 = preload("res://Sprites/GUI/sprite228_0.png")
var dd = preload("res://Sprites/GUI/sprite357_0.png")
var t = preload("res://Sprites/GUI/sprite358_0.png")
var tn = preload("res://Sprites/GUI/sprite358_1.png")
var bossaf = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.gui = self
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Guigui/Bars/bar/Count/lifebar/TextureProgress.max_value = PlVar.manamax
	if PlVar.scenario[16] != "1":
		$VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5.visible = false
	else:
		$VBoxContainer/barre/MarginContainer/NinePatchRect/attaque5.visible = true
	
	
	var nbdeb = int(PlVar.deblock[0]) + int(PlVar.deblock[1]) + int(PlVar.deblock[2]) + int(PlVar.deblock[3])
	if PlVar.last[1] == "0":
		$perso.texture = v
	if PlVar.last[1] == "1":
		$perso.texture = p
	if PlVar.last[1] == "2":
		if PlVar.deblock[2] == "1":
			$perso.texture = d1
		if PlVar.deblock[2] == "1" and PlVar.deblock[4] == "1":
			$perso.texture = dd
	if PlVar.last[1] == "3":
		if int(PlVar.scenario[14]) + int(PlVar.scenario[15]) == 2:
			$perso.texture = tn
		else:
			$perso.texture = t
	
	if PlVar.map == 7 or (PlVar.map == 3 and PlVar.phase == -35) or (PlVar.map == 12 and PlVar.scenario[16] == "2") or (PlVar.map == 14 and int(PlVar.scenario[17]) > 0) or PlVar.map == 19 or PlVar.map == 20:
		$bossfd.set_visible(true)
	else:
		$bossfd.set_visible(false)
	$bossfd/bar.scale.y = float(PlVar.bosslife)/float(PlVar.maxbosslife)
	
	if PlVar.last[2] == "0":
		$perso2.texture = v
	if PlVar.last[2] == "1":
		$perso2.texture = p
	if PlVar.last[2] == "2":
		if PlVar.deblock[2] == "1":
			$perso2.texture = d1
		if PlVar.deblock[2] == "1" and PlVar.deblock[4] == "1":
			$perso2.texture = dd
	if PlVar.last[2] == "3":
		if int(PlVar.scenario[14]) + int(PlVar.scenario[15]) == 2:
			$perso2.texture = tn
		else:
			$perso2.texture = t
	
	if PlVar.last[3] == "0":
		$perso3.texture = v
	if PlVar.last[3] == "1":
		$perso3.texture = p
	if PlVar.last[3] == "2":
		if PlVar.deblock[2] == "1":
			$perso3.texture = d1
		if PlVar.deblock[2] == "1" and PlVar.deblock[4] == "1":
			$perso3.texture = dd
	if PlVar.last[3] == "3":
		if int(PlVar.scenario[14]) + int(PlVar.scenario[15]) == 2:
			$perso3.texture = tn
		else:
			$perso3.texture = t
	
	if PlVar.tuto == 1:
		var backload = PlVar.get_gui_lang()
		$Label2.set_visible(true)
		$AnimatedSprite2.set_visible(true)
		var string = backload[37] + str(InputMap.get_action_list("info")[0].as_text()) + backload[40]
		string = string.replace("\n", "")
		$Label2.text = string
	elif PlVar.tuto == 2:
		var backload = PlVar.get_gui_lang()
		$Label2.set_visible(true)
		$AnimatedSprite2.set_visible(true)
		var string = backload[37] + str(InputMap.get_action_list("help")[0].as_text()) + backload[63]
		string = string.replace("\n", "")
		$Label2.text = string
	elif PlVar.tuto == 3:
		var backload = PlVar.get_gui_lang()
		$Label2.set_visible(true)
		$AnimatedSprite2.set_visible(true)
		var string = backload[37] + str(InputMap.get_action_list("ui_select")[0].as_text()) + backload[41]
		string = string.replace("\n", "")
		$Label2.text = string
	elif PlVar.tuto == 4:
		var backload = PlVar.get_gui_lang()
		$Label2.set_visible(true)
		$AnimatedSprite2.set_visible(true)
		var string = backload[37] + str(InputMap.get_action_list("selprogfer")[0].as_text()) + backload[42]
		string = string.replace("\n", "")
		$Label2.text = string
	else:
		$Label2.set_visible(false)
		$AnimatedSprite2.set_visible(false)
	visi = PlVar.dialo
	if visi == 0 or PlVar.pause == 0 :
		$VBoxContainer.set_visible(true)
		$Guigui.set_visible(true)
		if nbdeb == 1:
			$perso.set_visible(false)
			$perso2.set_visible(false)
			$perso3.set_visible(false)
		if nbdeb == 2:
			$perso.set_visible(true)
			$perso2.set_visible(false)
			$perso3.set_visible(false)
		if nbdeb == 3:
			$perso.set_visible(true)
			$perso2.set_visible(true)
			$perso3.set_visible(false)
		if nbdeb == 4 or nbdeb == 5:
			$perso.set_visible(true)
			$perso2.set_visible(true)
			$perso3.set_visible(true)
	if visi == 1 or PlVar.pause == 1 :
		$VBoxContainer.set_visible(false)
		$Guigui.set_visible(false)
		$perso.set_visible(false)
		$perso2.set_visible(false)
		$perso3.set_visible(false)
	var backload = PlVar.get_gui_lang()
	if PlVar.mort == 0 or PlVar.mort == 2:
		$Label.text = backload[18]
	if PlVar.mort == 1:
		$Label.text = backload[19]
	if PlVar.chargement == 0:
		$AnimatedSprite.set_visible(false)
		$Label.set_visible(false)
	if PlVar.chargement == 1:
		$AnimatedSprite.set_visible(true)
		$Label.set_visible(true)
	if PlVar.succment == -1:
		$AnimatedSprite3.set_visible(false)
		$cadre.set_visible(false)
		$image.set_visible(false)
	else:
		$AnimatedSprite3.set_visible(true)
		$cadre.set_visible(true)
		$image.texture = load("res://Sprites/GUI/Succes/" + str(PlVar.succment) + ".png")
		$image.set_visible(true)
	if PlVar.perso == -100:
		$VBoxContainer/barre.set_visible(false)
	else:
		$VBoxContainer/barre.set_visible(true)
		
	#if PlVar.life == 100:
	#	$Guigui/Bars/bar/Count/Background/Numbers.add_color_override("font_color_shadow", Color(255, 255, 255))
	#if PlVar.life <= 99:
	#	$Guigui/Bars/bar/Count/Background/Numbers.add_color_override("font_color_shadow", Color((100 + (100 - PlVar.life)), 197, 43))
	#if PlVar.life <= 10:
	#	$Guigui/Bars/bar/Count/Background/Numbers.add_color_override("font_color_shadow", Color(190, (190 - (100 - PlVar.life)*2), 43))
	if PlVar.diffdou != 0 and PlVar.dialo == 0:
		$Temps.visible = true
		$Temps.text = str(PlVar.heures) + ":" + str(PlVar.minutes) + ":" + str(PlVar.secondes)
	else:
		$Temps.visible = false
	pass
	
	
func bossf(nbb):
	$bossfd.texture = load("res://Sprites/GUI/Bars/boss" + str(nbb) + "fd.png")
	$bossfd/bar.texture = load("res://Sprites/GUI/Bars/boss" + str(nbb) + "bar.png")
	$bossfd/boss.texture = load("res://Sprites/GUI/Bars/boss" + str(nbb) + ".png")
	var backload = PlVar.get_gui_lang()
	var bosslist = backload[51].rsplit(";")
	$Bossfight2.text = bosslist[nbb]
	PlVar.clic(5)
	$Bossfight.set_visible(true)
	$Timer.start(0.5)
	pass

func _on_Timer_timeout():
	bossaf +=1
	if bossaf == 1:
		PlVar.clic(4)
		$Bossfight2.set_visible(true)
		$Timer.start(3)
		pass
	if bossaf == 2:
		$Bossfight.set_visible(false)
		$Timer.start(0.5)
		pass
	if bossaf == 3:
		$Bossfight2.set_visible(false)
		bossaf = 4
		$Timer.stop()
		pass
	pass # Replace with function body.


func _on_Timer2_timeout():
	$AnimatedSprite3.set_visible(false)
	$cadre.set_visible(false)
	$image.set_visible(false)
	pass # Replace with function body.
