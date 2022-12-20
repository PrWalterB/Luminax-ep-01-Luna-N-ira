extends CanvasLayer

var detectcon = 0
var lang = 0
var PLlang = "en"
var resetg = 0
var reseto = 0
var decensure = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$TabContainer/General/Zoom.value = PlVar.zoom
	$TabContainer/General/Rotation.value = PlVar.rotate
	$TabContainer/General/Vitesse.value = PlVar.smooth
	$TabContainer/General/MusicbL.value = PlVar.music
	$TabContainer/General/SonbL.value = PlVar.son
	if OS.is_window_fullscreen() == true:
		$TabContainer/General/CheckBox.set_pressed(true)
	if OS.is_window_fullscreen() == false:
		$TabContainer/General/CheckBox.set_pressed(false)
	if PlVar.guide == 1:
		$TabContainer/General/CheckBox2.set_pressed(true)
	if PlVar.guide == 0:
		$TabContainer/General/CheckBox2.set_pressed(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	var backload = PlVar.get_gui_lang()
	$TabContainer/General/LangueL.text = backload[5]
	$TabContainer/General/SonL.text = backload[6]
	$TabContainer/General/GraphL.text = backload[7]
	$TabContainer/General/ZoomL.text = backload[8]
	$TabContainer/Controls/AttacksL.text = backload[9].replace("\n", "") + " 01\n\n"+backload[9].replace("\n", "")+" 02\n\n"+backload[9].replace("\n", "")+" 03\n\n"+backload[9].replace("\n", "")+" 04\n\n"+backload[10].replace("\n", "")
	$TabContainer/Controls/InteractL.text = backload[11]
	$TabContainer/Controls/InfoL.text = backload[31]
	$TabContainer/General/MusicL.text = backload[14]
	$TabContainer/General/SonL.text = backload[15]
	$TabContainer/General/RotationL.text = backload[16]
	$TabContainer/General/VitesseL.text = backload[17]
	$TabContainer/General/CheckBox.text = backload[67]
	$TabContainer/General/CheckBox2.text = backload[68]
	$TabContainer/General/Reset1.text = backload[69]
	$TabContainer/General/Reset2.text = backload[70]
	$TabContainer/Controls/HelpL.text = backload[71]
	$Valider.text = backload[12]
	$Annuler.text = backload[13]
	
	if PlVar.pause == 0:
		detectcon = 0
		queue_free()
	$TabContainer/General/OptionButton.icon = load("res://Languages/"+PlVar.lang+".png")
	if PlVar.lang == "fr":
		lang = 0
	if PlVar.lang == "en":
		lang = 1
	$TabContainer/General/OptionButton.selected = lang
	PlVar.zoom = $TabContainer/General/Zoom.value
	PlVar.rotate = $TabContainer/General/Rotation.value
	PlVar.smooth = $TabContainer/General/Vitesse.value
	PlVar.music = $TabContainer/General/MusicbL.value
	PlVar.son = $TabContainer/General/SonbL.value
	
	if $TabContainer/General/CheckBox.is_pressed() == true:
		OS.set_window_fullscreen(true)
	if $TabContainer/General/CheckBox.is_pressed() == false:
		OS.set_window_fullscreen(false)
	if $TabContainer/General/CheckBox2.is_pressed() == true:
		PlVar.guide = 1
	if $TabContainer/General/CheckBox2.is_pressed() == false:
		PlVar.guide = 0
	if $TabContainer/General/Reset1.is_pressed() == true:
		reseto = 1
	if $TabContainer/General/Reset1.is_pressed() == false:
		reseto = 0
	if $TabContainer/General/Reset2.is_pressed() == true:
		resetg = 1
	if $TabContainer/General/Reset2.is_pressed() == false:
		resetg = 0
	
	for i in $TabContainer/Controls.get_children():
		if i.name[0] == "B":
			var nom = i.name.right(3)
			if detectcon == 0:
				i.set_disabled(false)
				i.text = str(InputMap.get_action_list(nom)[0].as_text())
				if InputMap.get_action_list(nom)[0] is InputEventMouseButton:
					i.text = "MOUSE" + str(InputMap.get_action_list(nom)[0].get_button_index())
			if detectcon != 0:
				i.set_disabled(true)
				if int(i.name[1] + i.name[2]) == detectcon:
					i.text = "..."
			
				
	pass


func _on_Valider_pressed():
	PlVar.clic(2)
	if reseto == 0 and resetg == 0:
		PlVar.save_cfg()
		PlVar.save_input()
		detectcon = 0
		if PlVar.map == -1:
			PlVar.pause = 0
	elif reseto == 1:
		if OS.get_locale() in ["fr_FR", "fr_BE", "fr_CA", "fr_CH", "fr_LU", "fr_MC"]:
			PLlang = "fr"
		else:
			PLlang = "en"
		var save_cfg = File.new()
		save_cfg.open("user://user.licfg", File.WRITE)
		save_cfg.store_line("0|" + PLlang + "|0.45|false|-2|-15|0|10|1")
		save_cfg.close()
		PlVar.load_cfg()
		detectcon = 0
		if PlVar.map == -1:
			PlVar.pause = 0
	elif resetg == 1:
		PlVar.reset_game()
	else:
		if OS.get_locale() in ["fr_FR", "fr_BE", "fr_CA", "fr_CH", "fr_LU", "fr_MC"]:
			PLlang = "fr"
		else:
			PLlang = "en"
		var save_cfg = File.new()
		save_cfg.open("user://user.licfg", File.WRITE)
		save_cfg.store_line("0|" + PLlang + "|0.45|false|-2|-15|0|10|1")
		save_cfg.close()
		PlVar.load_cfg()
		detectcon = 0
		if PlVar.map == -1:
			PlVar.pause = 0
		PlVar.reset_game()
	queue_free()
	pass # Replace with function body.


func _on_Annuler_pressed():
	PlVar.clic(3)
	PlVar.load_cfg()
	detectcon = 0
	if PlVar.map == -1:
		PlVar.pause = 0
	queue_free()
	pass # Replace with function body.


func _on_BUp_pressed():
	detectcon = 1
	PlVar.clic(1)
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		pass
	else:
		for i in $TabContainer/Controls.get_children():
			if i.name[0] == "B":
				var nom = i.name.right(3)
				if detectcon == int(i.name[1] + i.name[2]):
					InputMap.action_erase_event(nom, InputMap.get_action_list(nom)[0])
					InputMap.action_add_event(nom, event)
					detectcon = 0
	pass


func _on_BRight_pressed():
	detectcon = 2
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BLeft_pressed():
	detectcon = 3
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BDown_pressed():
	detectcon = 4
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BAtt1_pressed():
	detectcon = 5
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BAtt2_pressed():
	detectcon = 6
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BAtt3_pressed():
	detectcon = 7
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BAtt4_pressed():
	detectcon = 8
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BAtt5_pressed():
	detectcon = 9
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BSV_pressed():
	detectcon = 10
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BSP_pressed():
	detectcon = 11
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BSD_pressed():
	detectcon = 12
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BST_pressed():
	detectcon = 13
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BInter_pressed():
	detectcon = 14
	PlVar.clic(1)
	pass # Replace with function body.


func _on_OptionButton_item_selected(ID):
	if ID == 0:
		PlVar.lang = "fr"
	if ID == 1:
		PlVar.lang = "en"
	PlVar.clic(1)
	pass # Replace with function body.


func _on_BInfo_pressed():
	detectcon = 15
	PlVar.clic(1)
	pass # Replace with function body.


func _on_OptionButton_pressed():
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_Zoom_value_changed(value):
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_Rotation_value_changed(value):
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_Vitesse_value_changed(value):
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_MusicbL_value_changed(value):
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_SonbL_value_changed(value):
	PlVar.clic(1)
	pass # Replace with function body.


func _on_CheckBox_pressed():
	PlVar.clic(1)
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_TabContainer_tab_changed(tab):
	PlVar.clic(1)
	pass # Replace with function body.


func _on_CheckBox2_pressed():
	PlVar.clic(1)
	pass # Replace with function body.


func _on_Reset2_pressed():
	decensure += 1
	if decensure == 8:
		PlVar.clic(2)
		PlVar.censor = 1
		PlVar.save_succ(49)
	else:
		PlVar.clic(1)
	pass # Replace with function body.


func _on_Reset1_pressed():
	PlVar.clic(1)
	pass # Replace with function body.


func _on_B16help_pressed():
	detectcon = 16
	PlVar.clic(1)
	pass # Replace with function body.


func _on_OptionButton_item_focused(ID):
	if ID == 0:
		$TabContainer/General/OptionButton.icon = load("res://Languages/fr.png")
		$TabContainer/General/OptionButton.text = "Français"
	if ID == 1:
		$TabContainer/General/OptionButton.icon = load("res://Languages/en.png")
		$TabContainer/General/OptionButton.text = "English"
	pass # Replace with function body.
