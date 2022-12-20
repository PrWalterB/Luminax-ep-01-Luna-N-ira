extends Node
var bild = preload("res://Scenes/Entities/Bilder.tscn")
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var boss3 = preload("res://Scenes/Entities/Ecyleam.tscn")
var flemme = 0
var transtat = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Node2D/player.global_position = Vector2(3819, 5424)
#	PlVar.deblock= "11111"
	PlVar.map = 12
	PlVar.get_node("Musique").stream_paused = false
	PlVar.kelmus = 19
	PlVar.loop = 0
	$BILDER.start(rand_range(0.1, 2.0))
	$GNEU.start(rand_range(1.0, 5.0))
	if PlVar.scenario[16] == "1":
		PlVar.kelmus = 21
		PlVar.loop = 0
		get_node("Node2D/Dialogues/0000877").name = "0000900"
		get_node("Node2D/14183tree").visible = true
		transtat = 1
	if PlVar.scenario[15] == "1":
		get_node("Node2D/Props/02Tog0").global_position = Vector2(0,0)
		get_node("Node2D/Props/01Progfer0").global_position = Vector2(0,0)
		get_node("Node2D/Props/03Doobliks0").global_position = Vector2(0,0)
		get_node("Node2D/Props/00OlH0").global_position = Vector2(0,0)
	else:
		PlVar.dialo = 1
		if PlVar.scenario[14] == "2":
			PlVar.phase = 819
		else:
			PlVar.phase = 989
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.scenario[15] = "1"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Node2D/Props/Maelyc/FrontComplete.modulate = Color(1,1,1,transtat)
	if PlVar.phase == 828 or PlVar.phase == 998:
		if flemme == 0:
			get_node("Node2D/Props/00OlH0").set_visible(true)
			get_node("Node2D/Props/00OlH0").chara = ("00OlApp")
			PlVar.kelmus = 14
			PlVar.loop = 0
			flemme = 1
	if PlVar.phase == 831 and PlVar.kelmus != 6:
		PlVar.kelmus = 6
		PlVar.loop = 0
	if PlVar.phase == 839:
		if get_node("Node2D/Props/00OlH0").animation == "00OlH":
			get_node("Node2D/Props/00OlH0").chara = ("00OlBug")
			PlVar.kelmus = 19
			PlVar.loop = 0
	if PlVar.phase == 1003:
		if get_node("Node2D/Props/00OlH0").animation == "00OlH":
			get_node("Node2D/Props/00OlH0").chara = ("00OlDApp")
			PlVar.kelmus = 19
			PlVar.loop = 0
	if PlVar.phase == 850 or PlVar.phase == 1011:
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 852 or PlVar.phase == 1013:
		PlVar.deblock = "11111"
		PlVar.dialo = 0
		PlVar.phase = 0
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.chargement = 1
		$Node2D/player/Black2.fondu(-0.01, 0)
		PlVar.save_game()
		$Charge.start(1)
	if PlVar.phase == 888:
		var b = boss3.instance()
		PlVar.save_succ(11)
		b.global_position = $Node2D/Boss3.position
		add_child(b)
		get_node("Node2D/Dialogues/0000877/CollisionPolygon2D").set_disabled(true)
		print("BARBARA !! A")
		PlVar.save_game()
		PlVar.chargement = 1
		$Charge.start(1)
	pass


func _on_BILDER_timeout():
	$Node2D/Bilders.position.x = rand_range(0, 7420)
	var b = bild.instance()
	b.type = 0
	b.global_position = $Node2D/Bilders.position
	b.z_index = 10
	add_child(b)
	$BILDER.start(rand_range(0.1, 2.0))
	pass # Replace with function body.


func _on_GNEU_timeout():
	$Node2D/Gneus.position.y = rand_range(2000, 4000)
	var b = bild.instance()
	b.type = 1
	b.global_position = $Node2D/Gneus.position
	add_child(b)
	$GNEU.start(rand_range(1.0, 5.0))
	pass # Replace with function body.


func _on_00OlH0_animation_finished():
	if get_node("Node2D/Props/00OlH0").animation == "00OlApp":
		get_node("Node2D/Props/00OlH0").chara = ("00OlH")
	if get_node("Node2D/Props/00OlH0").animation == "00OlBug" or get_node("Node2D/Props/00OlH0").animation == "00OlDApp":
		get_node("Node2D/Props/00OlH0").set_visible(false)
		get_node("Node2D/Props/00OlH0").global_position = Vector2(0,0)
	pass # Replace with function body.

func _on_Timer_timeout():
	if PlVar.phase == 851 or PlVar.phase == 1012:
		PlVar.phase += 1
		get_node("Node2D/Props/02Tog0").global_position = Vector2(0,0)
		get_node("Node2D/Props/01Progfer0").global_position = Vector2(0,0)
		get_node("Node2D/Props/03Doobliks0").global_position = Vector2(0,0)
		get_node("Node2D/Props/00OlH0").global_position = Vector2(0,0)
		pass
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.
