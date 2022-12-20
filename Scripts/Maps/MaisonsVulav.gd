extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var flemme = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 11
	$Node2D/fleche1.supguide = 0
	$Node2D/fleche2.supguide = 0
	if PlVar.scenario[14] != "0":
		$Node2D/Team.set_global_position(Vector2(0,0))
		get_node("Node2D/Team/00OlH0").global_position = Vector2(0,-10000)
	if PlVar.scenario[14] == "2":
		get_node("Node2D/Dialogues/0000812").queue_free()
	if OS.get_datetime()["hour"] == 16 or OS.get_datetime()["hour"] == 22 or OS.get_datetime()["hour"] == 4 or OS.get_datetime()["hour"] == 10:
		get_node("Node2D/14143fire").visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == 768 or (PlVar.phase >= 777 and PlVar.phase <= 787):
		get_node("Node2D/Team/01Progfer0").chara = ("stress")
	else:
		get_node("Node2D/Team/01Progfer0").chara = ("01Progfer")
	if PlVar.phase == 743:
		if flemme == 0:
			PlVar.kelmus = 14
			PlVar.loop = 0
			get_node("Node2D/Team/00OlH0").set_visible(true)
			get_node("Node2D/Team/00OlH0").chara = ("00OlApp")
			flemme = 1
	if PlVar.phase == 761:
		PlVar.kelmus = 15
		PlVar.loop = 0
		if get_node("Node2D/Team/00OlH0").animation == "00OlH":
			get_node("Node2D/Team/00OlH0").chara = ("00OlDApp")
	if PlVar.phase == 737:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 739:
		$Node2D/Team.set_global_position(Vector2(0,0))
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase += 1
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
	if PlVar.phase == 816:
		$Charge.start(3)
		PlVar.chargement = 1
		get_node("Node2D/Dialogues/0000812").queue_free()
		PlVar.scenario[14] = "2"
		PlVar.save_succ(7)
		PlVar.save_game()
	if PlVar.scenario[14] != "1":
		$Node2D/fleche1.supguide = 0
		$Node2D/fleche2.supguide = 0
	elif PlVar.phase == 800:
		$Node2D/fleche1.supguide = 1
		$Node2D/fleche2.supguide = 1
	pass


func _on_Timer_timeout():
	if PlVar.phase == 738:
		PlVar.phase += 1
	pass # Replace with function body.


func _on_00OlH0_animation_finished():
	if get_node("Node2D/Team/00OlH0").animation == "00OlApp":
		get_node("Node2D/Team/00OlH0").chara = ("00OlH")
	if get_node("Node2D/Team/00OlH0").animation == "00OlDApp":
		get_node("Node2D/Team/00OlH0").set_visible(false)
		get_node("Node2D/Team/00OlH0").global_position = Vector2(0,0)
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.
