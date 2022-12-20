extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 10
#	$Node2D/player.position = Vector2(39,411)
	$Node2D/fleche0.supguide = 1
	$fleche0.supguide = 0
	if PlVar.scenario[14] != "0":
		$Node2D/fleche0.supguide = 0
		$fleche0.supguide = 1
		$Node2D/Team.global_position = Vector2(-10000, -10000)
	if PlVar.scenario[13] == "0":
		var b = dialogb.instance()
		get_parent().call_deferred("add_child",b)
		get_node("Node2D/Team/00Tog1").set_visible(true)
		get_node("Node2D/Team/00Progfer1").set_visible(true)
		get_node("Node2D/Team/03Doobliks1").set_visible(true)
		get_node("Node2D/Team/03Tog0").set_visible(false)
		get_node("Node2D/Team/01Progfer0").set_visible(false)
		get_node("Node2D/Team/00Doobliks0").set_visible(false)
		get_node("Node2D/Team/00Doublix0").set_visible(false)
		PlVar.dialo = 1
		PlVar.phase = 562
		PlVar.scenario[13] = "1"
	else:
		get_node("Node2D/Team/03Tog0").set_visible(true)
		get_node("Node2D/Team/01Progfer0").set_visible(true)
		get_node("Node2D/Team/00Doobliks0").set_visible(true)
		get_node("Node2D/Team/00Doublix0").set_visible(true)
		get_node("Node2D/Team/00Tog1").queue_free()
		get_node("Node2D/Team/00Progfer1").queue_free()
		get_node("Node2D/Team/03Doobliks1").queue_free()
	if OS.get_datetime()["hour"] == 16 or OS.get_datetime()["hour"] == 22 or OS.get_datetime()["hour"] == 4 or OS.get_datetime()["hour"] == 10:
		$Node2D/Decor/Brume.animation = "roge"
		get_node("Node2D/Dialogues/0000581").name = "0001403"
		get_node("Node2D/14063fire").visible = true
		get_node("Node2D/14103fire").visible = true
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == 572:
		PlVar.messf = ""
		PlVar.dialo = 1
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 574:
		PlVar.dialo = 0
		PlVar.phase = 0
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.chargement = 1
		PlVar.save_game()
		$Charge.start(1)
		$Node2D/player/Black2.fondu(-0.01, 1)
	if PlVar.phase == -2:
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.save_game()
		PlVar.chargement = 1
		PlVar.phase = -33
		$Charge.start(1)
		$Timer.start(3)
	pass


func _on_Timer_timeout():
	if PlVar.phase == 573:
		PlVar.phase += 1
		get_node("Node2D/Team/03Tog0").set_visible(true)
		get_node("Node2D/Team/01Progfer0").set_visible(true)
		get_node("Node2D/Team/00Doobliks0").set_visible(true)
		get_node("Node2D/Team/00Doublix0").set_visible(true)
		get_node("Node2D/Team/00Tog1").queue_free()
		get_node("Node2D/Team/00Progfer1").queue_free()
		get_node("Node2D/Team/03Doobliks1").queue_free()
		pass
	if PlVar.phase == -33:
		Omni.goto_scene("res://Scenes/Maps/Clouds.tscn")
		PlVar.phase = -33
		PlVar.perso = 0
		PlVar.cara = 0
	pass # Replace with function body.


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.
