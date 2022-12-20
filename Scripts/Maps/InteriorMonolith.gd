extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var part = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 13
	PlVar.get_node("Musique").stream_paused = true
	#if PlVar.scenario[17] == "0":
	PlVar.scenario[17] = "0"
	PlVar.save_game()
	PlVar.chargement = 1
	$Charge.start(3)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$AudioStreamPlayer.set_volume_db(PlVar.son)
	if PlVar.phase == 922 or PlVar.phase == 982:
		$Node2D/player/Black2.fondu(0.01, 0)
		PlVar.phase += 1
		$Timer.start(3)
	if PlVar.phase == 984:
		PlVar.deblock = "10000"
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.nextmap = 14
		PlVar.nextx = 1523
		PlVar.nexty = 2543
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	if PlVar.phase == 924:
		$Node2D/Team.set_global_position(Vector2(0,0))
		$Node2D/player/Black2.fondu(-0.01, 1)
		PlVar.phase += 1
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
	if PlVar.phase == 928:
		$Node2D/screen.set_animation("wait")
	if PlVar.phase == 929 and $Node2D/screen.animation != "charge":
		$Node2D/screen.set_animation("charge")
	if PlVar.phase == 930:
		get_node("Node2D/Team/01Progfer0").chara = "stress"
	if PlVar.phase == 931 and get_node("Node2D/Team/01Progfer0").chara != "pcara1":
		get_node("Node2D/Team/01Progfer0").chara = "pcara1"
		var b = part.instance()
		b.global_position = get_node("Node2D/Team/01Progfer0").global_position
		b.start(5, 0.2)
		get_parent().add_child(b)
	if PlVar.phase == 932 and $Node2D/screen.animation != "luniens":
		$Node2D/screen.play("luniens")
		PlVar.save_succ(13)
	if PlVar.phase == 965 and get_node("Node2D/Team/01Progfer0").chara != "01Progfer":
		get_node("Node2D/Team/01Progfer0").chara = "01Progfer"
		var b = part.instance()
		b.global_position = get_node("Node2D/Team/01Progfer0").global_position
		b.start(5, 0.2)
		get_parent().add_child(b)
	if PlVar.phase == 966:
		$Node2D/screen.set_animation("bug")
		PlVar.messf = ""
		var d = part.instance()
		d.start(8, 0.5)
		d.global_position = get_node("Node2D/Team/01Doubliks0").global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = get_node("Node2D/Team/01Tog0").global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = get_node("Node2D/Team/01Progfer0").global_position
		get_parent().add_child(d)
		d = part.instance()
		d.start(8, 0.5)
		d.global_position = $Node2D/player.global_position
		get_parent().add_child(d)
		PlVar.dialo = 1
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 8
		PlVar.loop = 0
		$Node2D/player/Camera2D.shake(10,20,20)
		get_node("Node2D/Team/01Progfer0").chara = "pcara1"
		var b = part.instance()
		b.global_position = get_node("Node2D/Team/01Progfer0").global_position
		b.start(5, 0.2)
		get_parent().add_child(b)
		PlVar.phase += 1
		$Timer.start(5)
	if PlVar.phase == 968:
		$AudioStreamPlayer.play()
		PlVar.get_node("Musique").stream_paused = false
		PlVar.kelmus = 22
		PlVar.loop = 0
		var d = dialogb.instance()
		get_parent().add_child(d)
		PlVar.dialo = 1
		PlVar.phase += 1
	if PlVar.phase == 975 and $Node2D/traw.animation != "eyes":
		$Node2D/traw.set_animation("eyes")
	if PlVar.phase == 976 and $Node2D/traw.animation != "traw":
		$Node2D/traw.play("traw")
	if PlVar.phase == 978:
		$Node2D/traw.set_animation("laugh")
	if PlVar.phase == 981:
		$Node2D/traw.set_animation("bye")
	pass


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.

func _on_Timer_timeout():
	if PlVar.phase == 923 or PlVar.phase == 967 or PlVar.phase == 983:
		PlVar.phase += 1
	pass # Replace with function body.


func _on_screen_animation_finished():
	if $Node2D/screen.animation == "charge":
		$Node2D/screen.playing = false
		$Node2D/screen.frame = 10
	pass # Replace with function body.


func _on_traw_animation_finished():
	if $Node2D/traw.animation == "eyes":
		$Node2D/traw.playing = false
		$Node2D/traw.frame = 9
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
	pass # Replace with function body.
