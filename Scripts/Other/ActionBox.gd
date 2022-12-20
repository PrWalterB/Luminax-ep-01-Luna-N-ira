extends CanvasLayer
var message = ""
var vit = 0.2
var i = 0
var allow = 0
var alow = 0
var chara = 0
var pp = 0
var thend = 0
var backdials = []
var fontv= preload("res://Fonts/defaut.tres")
var fontbm= preload("res://Fonts/blackmoon.tres")
func _ready():
	var dialogues = File.new()
	if not dialogues.file_exists("res://Languages/"+ PlVar.lang + "action.tres"):
		return
	dialogues.open("res://Languages/"+ PlVar.lang + "action.tres", File.READ)
	while not dialogues.eof_reached():
		var current_line = dialogues.get_line().rsplit("|")
		backdials.append(current_line)
	$Timer3.start(0.0009)
	PlVar.vitphac = (backdials[PlVar.phaction][1].length() * 0.03) + 1
	$Timer2.start(PlVar.vitphac)
	if PlVar.phaction >= 56 and PlVar.phaction <= 70:
		$Message.rect_global_position.y += 60
		$Name.rect_global_position.y += 60
		$Message.set_modulate(Color(1,1,1))
	if PlVar.phaction == 56:
		$Timer2.start(7.98)
	if PlVar.phaction == 57:
		$Timer2.start(5.98)
	if PlVar.phaction == 58 or PlVar.phaction == 59 or PlVar.phaction == 60:
		$Timer2.start(11.98)
	if PlVar.phaction == 61:
		$Timer2.start(18.98)
	if PlVar.phaction == 62 or PlVar.phaction == 67:
		$Timer2.start(2.98)
	if PlVar.phaction == 64 or PlVar.phaction == 66 or PlVar.phaction == 69:
		$Timer2.start(7.98)
	if PlVar.phaction == 65:
		$Timer2.start(3.98)
	if PlVar.phaction == 63:
		$Timer2.start(5.98)
	if PlVar.phaction == 68 or PlVar.phaction == 70:
		$Timer2.start(9.98)
	
	alow = 0
	allow = 0
	#Lance le timer de dialogues
	$Timer.start(0.001)
	#Chargement des dialogues selon la langue

	pass


# warning-ignore:unused_argument
func _process(delta):
	if PlVar.mort != 0:
		queue_free()
	
	if PlVar.phase == 200 or PlVar.phase == 201 or PlVar.phase == 206 or PlVar.phase == 207 or PlVar.phase == 225 or PlVar.phase == 226 or PlVar.phase == 233 or PlVar.phase == 234:
		queue_free()
	#Implémentation des dialogues et paramètres selon la phase
	thend = int(backdials[PlVar.phaction][0]); message = backdials[PlVar.phaction][1]; chara = float(backdials[PlVar.phaction][2]); pp = int(backdials[PlVar.phaction][3]); PlVar.pp = int(backdials[PlVar.phaction][3]); PlVar.chara = float(backdials[PlVar.phaction][2])
	var messagesplit = message.rsplit("\\n")
	message = ""
	for i in messagesplit:
		message = message + i + "\n"
	#Paramétrage de la police
	if chara == -1:
		vit = 0.06
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 1, 0.952941))
		$Name.text = ""
		$Sprite.visible = false
	if chara == 0:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.529412, 1))
		$Name.text = ""
		$Sprite.visible = false
	if chara == 1:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.431373, 0.733333, 1))
		$Name.text = "Progfer"
	if chara == 1.5:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.211765, 0))
		$Name.text = "Progfer"
	if chara == 2:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.678431, 0, 0))
		$Name.text = "Doublix"
	if chara == 3:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Tog"
	if chara == 4:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Doobliks"
	if chara == 5:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Soldat Hydroplanien"
	if chara == 6:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Name.text = "Chloralyen"
	if chara == 7:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Anddr"
	if chara == 8:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Présidente Olga"
	if chara == 9:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0, 0.509804, 0.662745))
		$Name.text = "Hydroplanien"
	if chara == 10:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.211765, 0))
		$Name.text = "Stalor"
	if chara == 11:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.34902, 0.34902, 0.34902))
		$Name.text = "Cygien"
	if chara == 12:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.678431, 0, 0))
		$Name.text = "Vulavien"
	if chara == 13:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Name.text = "Capitaine Chloralyen"
	if chara == 14:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Name.text = "Soldat Chloralyen"
	if chara == 15:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.223529, 1, 0))
		$Name.text = "???"
	if chara == 100:
		vit = 0.02
		$Message.add_font_override("normal_font", fontbm)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Name.text = "???"
	if chara == 101:
		vit = 0.02
		$Message.add_font_override("normal_font", fontbm)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Name.text = ""
	if chara == 102:
		vit = 0.08
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.101961, 0, 0.070588))
		$Name.text = ""
	if chara == 103:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.45098, 0, 0.4))
		$Name.text = ""
	if chara == 104:
		vit = 0.02
		$Message.add_font_override("normal_font", fontv)
		$Message.add_color_override("default_color", Color(0.45098, 0, 0.4))
		$Name.text = "Traw"
	vit = vit*PlVar.uldelta
	#Paramétrage de la pp
	if pp == 0:
		$ProfilePic.set_texture(null)
	else:
		$ProfilePic.set_texture(load("res://Sprites/GUI/Dials/"+str(pp)+".png"))

	#Destruction si dialogue de fin
	if thend == 1:
		PlVar.dialo = 2
		PlVar.phaction = 0
		queue_free()

	$Message.text = PlVar.messf
	pass


func _on_Timer_timeout():
	if PlVar.messf == message or i > len(message):
		i = 0
	if PlVar.messf != message and i < len(message):
		PlVar.messf = PlVar.messf + message[i]
		i += 1
		$talk.play()
		$Timer.start(vit)
	pass # Replace with function body.


func _on_Timer2_timeout():
	PlVar.messf = ""
	PlVar.phaction = 0
	queue_free()
	$Timer2.start(0.5)
	
	pass # Replace with function body.


func _on_Timer3_timeout():
	chara = float(backdials[PlVar.phaction][2])
	$talk.set_volume_db(PlVar.son - 10)
	$talk.stream = load("res://Sons/Talking/" + str(chara) + ".wav")
	$Timer3.stop()
	pass # Replace with function body.
