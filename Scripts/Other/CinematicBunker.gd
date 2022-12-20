extends Node2D
var step = -1
var white = preload("res://Sprites/Cinematics/Begin/white.png")
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(0.001)
	$Node2D2/VideoPlayer.play()
	PlVar.animation = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Node2D2/VideoPlayer.set_volume_db(PlVar.music + 2)
	if step == 14:
		if $Node2D/Obj2.frame == 9:
			$Node2D/Black2.set_visible(true)
			$Fondu.start(3)
			step = 15
	pass


func _on_Timer_timeout():
	if step == 7:
		step = 8
		PlVar.i = 0
		PlVar.messf = ""
		if PlVar.scenario[8] == "2":
			PlVar.phase = 421
		if PlVar.scenario[8] == "1":
			PlVar.phase = 491
		PlVar.get_node("Musique").stream_paused = false
		var b = dialogb.instance()
		get_parent().add_child(b)
		PlVar.dialo = 1
		PlVar.animation = 0
		queue_free()
	if step == 6:
		step = 7
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(70)
		$Timer.start(10)
	if step == 5:
		step = 6
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(69)
		$Timer.start(8)
	if step == 4:
		step = 5
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(68)
		$Timer.start(10)
	if step == 3:
		step = 4
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(67)
		$Timer.start(3)
	if step == 2:
		step = 3
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(66)
		$Timer.start(8)
	if step == 1:
		step = 2
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(65)
		$Timer.start(4)
	if step == 0:
		step = 1
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(64)
		$Timer.start(8)
	if step == -1:
		step = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(63)
		$Timer.start(6)
	pass # Replace with function body.


func _on_Fondu_timeout():
	if step == 15:
		$Black2.set_texture(white)
		Omni.goto_scene("res://Scenes/Maps/MaisonVeget.tscn")
		step = 16
	pass # Replace with function body.
