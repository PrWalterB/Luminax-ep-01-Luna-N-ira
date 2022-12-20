extends CanvasLayer
var message = ""
var vit = 0.2
var allow = 0
var alow = 0
var chara = 0
var pp = 0
var thend = 0
var backdials = []
var fontv= preload("res://Fonts/defaut.tres")
# warning-ignore:unused_class_variable
var fontp= preload("res://Fonts/progfer.tres")
# warning-ignore:unused_class_variable
var fontd1= preload("res://Fonts/doublix.tres")
# warning-ignore:unused_class_variable
var fontchlo= preload("res://Fonts/chloralyen.tres")
var fontbm= preload("res://Fonts/blackmoon.tres")
var box0 = preload("res://Sprites/GUI/Theme/nonestyleboxtexture.tres")
var box1 = preload("res://Sprites/GUI/Theme/DialogueBox.tres")
var box2 = preload("res://Sprites/GUI/Theme/DialogueBoxReverse.tres")
func _ready():
	PlVar.clic(1)
	print(PlVar.phase)
	alow = 0
	allow = 0
	#Lance le timer de dialogues
	$Timer.start(0.001)
	#Lance le timer de skip
	$Timer2.start(0.2)
	#Chargement des dialogues selon la langue
	var dialogues = File.new()
	if not dialogues.file_exists("res://Languages/"+ PlVar.lang + "dials.tres"):
		return # Error! We don't have a save to load.
	dialogues.open("res://Languages/"+ PlVar.lang + "dials.tres", File.READ)
	while not dialogues.eof_reached():
		var current_line = dialogues.get_line().rsplit("|")
		backdials.append(current_line)
	$Timer3.start(0.0009)
	pass


# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == 200 or PlVar.phase == 201 or PlVar.phase == 206 or PlVar.phase == 207 or PlVar.phase == 225 or PlVar.phase == 226 or PlVar.phase == 233 or PlVar.phase == 234:
		PlVar.i = 0
		print("caca")
		queue_free()
	#Implémentation des dialogues et paramètres selon la phase
	thend = int(backdials[PlVar.phase][0]); message = backdials[PlVar.phase][1]; chara = float(backdials[PlVar.phase][2]); pp = int(backdials[PlVar.phase][3])
	var messagesplit = message.rsplit("\\n")
	message = ""
	if thend == 2:
		PlVar.i = 0
		print("prout")
		queue_free()
	for i in messagesplit:
		message = message + i + "\n"
	#Paramétrage de la police
	if chara == -1:
		vit = 0.06
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 1, 0.952941))
		$Message.add_stylebox_override("normal", box0)
		$Name.text = ""
	if chara == 0:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.529412, 1))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = ""
	if chara == 1:
		vit = 0.005
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.431373, 0.733333, 1))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Progfer"
	if chara == 1.5:
		vit = 0.005
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.211765, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Progfer"
	if chara == 2:
		vit = 0.05
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.678431, 0, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Doublix"
	if chara == 3:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Tog"
	if chara == 4:
		vit = 0.01
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Doobliks"
	if chara == 5:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Soldat Hydroplanien"
	if chara == 6:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Chloralyen"
	if chara == 7:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Anddr"
	if chara == 8:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Présidente Olga"
	if chara == 9:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Hydroplanien"
	if chara == 10:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.211765, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Stalor"
	if chara == 11:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.34902, 0.34902))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Cygien"
	if chara == 12:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.678431, 0, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Vulavien"
	if chara == 13:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Capitaine Chloralyen"
	if chara == 14:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "Soldat Chloralyen"
	if chara == 15:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "???"
	if chara == 16:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Message.add_stylebox_override("normal", box1)
		$Name.text = "???"
	if chara == 100:
		vit = 0.02
		$Message.add_font_override("normal_font", fontbm)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Message.add_stylebox_override("normal", box2)
		$Name.text = "???"
	if chara == 101:
		vit = 0.02
		$Message.add_font_override("normal_font", fontbm)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Message.add_stylebox_override("normal", box2)
		$Name.text = ""
	if chara == 102:
		vit = 0.08
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Message.add_stylebox_override("normal", box2)
		$Name.text = ""
	if chara == 103:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.45098, 0, 0.4))
		$Message.add_stylebox_override("normal", box2)
		$Name.text = ""
	if chara == 104:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.45098, 0, 0.4))
		$Message.add_stylebox_override("normal", box2)
		$Name.text = "Traw"
	vit = vit*PlVar.uldelta

	#Paramétrage de la pp
	if pp == 0:
		$ProfilePic.set_texture(null)
	else:
		$ProfilePic.set_texture(load("res://Sprites/GUI/Dials/"+str(pp)+".png"))

	#Destruction si dialogue de fin
	if thend == 1:
		print(message)
		PlVar.dialo = 2
		PlVar.phase = 0
		PlVar.i = 0
		print("boudin")
		queue_free()

	if chara != -1:
		if Input.is_action_pressed("ui_select"):
			#Lance la ligne suivante
			if PlVar.messf == message:
				if allow == 2:
					PlVar.phase += 1
					chara = float(backdials[PlVar.phase][2])
					PlVar.messf = ""
					alow = 0
					allow = 0
					$Timer.start(0.001)
					$Timer2.start(0.2)
					PlVar.i = 0
					message = ""
					$talk.set_volume_db(PlVar.son)
					$talk.stream = load("res://Sons/Talking/" + str(chara) + ".wav")
			#Affiche tout le dialogue quand c'est possible
			if PlVar.messf != message:
				if alow == 1:
					PlVar.messf = message
					alow = 2
	$Message.text = PlVar.messf
	pass


func _on_Timer_timeout():
	if PlVar.messf == message or PlVar.i > len(message):
		PlVar.i = 0
	if PlVar.messf != message and PlVar.i < len(message):
		PlVar.messf = PlVar.messf + message[PlVar.i]
		PlVar.i += 1
		if PlVar.i % 2 == 0:
			$talk.play()
		$Timer.start(vit)
	pass # Replace with function body.


func _on_Timer2_timeout():
	#Lance la possibilité de passer au suivant
	if alow == 2 or PlVar.messf == message:
		allow = 2
	#Lance la possibilité de skip avec espace
	if alow == 0:
		alow = 1
	$Timer2.start(0.5)
	
	pass # Replace with function body.


func _on_Timer3_timeout():
	chara = float(backdials[PlVar.phase][2])
	$talk.set_volume_db(PlVar.son)
	$talk.stream = load("res://Sons/Talking/" + str(chara) + ".wav")
	$Timer3.stop()
	pass # Replace with function body.
