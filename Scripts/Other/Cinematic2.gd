extends Node2D
# warning-ignore:unused_class_variable
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var scin = 0
# warning-ignore:unused_class_variable
var ecoul = 0
var step = -1
var trans = 0
var image3 = preload("res://Sprites/Cinematics/Begin/back3.png")
var image12 = preload("res://Sprites/Cinematics/Begin/back12.png")
var image1 = preload("res://Sprites/Cinematics/Begin/back1.png")
var white = preload("res://Sprites/Cinematics/Begin/white.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = -2
	$VideoPlayer.volume_db = PlVar.music
	$VideoPlayer.play()
	$Timer.start(0.001)
	#$Timer2.start(11)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$VideoPlayer.set_volume_db(PlVar.music + 2)
	if step == 14:
		if $Node2D/Obj2.frame == 9:
			$Node2D/Black2.set_visible(true)
			$Fondu.start(3)
			step = 15
		
		
	if scin == 0:
		$Node2D/Obj.set_modulate(Color(1, 1, 1, 0.2-trans))
	if scin == 1:
		$Node2D/Obj.set_modulate(Color(1, 1, 1, 0.4-trans))
	if scin == 2:
		$Node2D/Obj.set_modulate(Color(1, 1, 1, 0.6-trans))
	if scin == 3:
		$Node2D/Obj.set_modulate(Color(1, 1, 1, 0.8-trans))
	if scin == 4:
		$Node2D/Obj.set_modulate(Color(1, 1, 1, 1-trans))
	pass


func _on_Timer_timeout():
	if step == 6:
		step = 7
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 2
	if step == 5:
		step = 6
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(62)
		$Timer.start(3)
	if step == 4:
		step = 5
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(61)
		$Timer.start(19)
	if step == 3:
		step = 4
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(60)
		$Timer.start(12)
	if step == 2:
		step = 3
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(59)
		$Timer.start(12)
	if step == 1:
		step = 2
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(58)
		$Timer.start(12)
	if step == 0:
		step = 1
		PlVar.i = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(57)
		$Timer.start(6)
	if step == -1:
		step = 0
		PlVar.phaction = 0
		PlVar.messf = ""
		PlVar.action(56)
		$Timer.start(8)
	pass # Replace with function body.


func _on_Timer2_timeout():
	if step == 13:
		$Camera2D.offset.x = 0
		$Camera2D.offset.y = 0
		$Camera2D.zoom.x = 1
		$Camera2D.zoom.y = 1
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 2
		$Node2D/Background9.set_texture(image1)
		$Node2D/Obj2.play("default")
		step = 14
	if step == 12:
		$Node2D/Background9.set_texture(image12)
		step = 13
		$Timer2.start(1)
	if step == 11:
		step = 12
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 24
		$Timer2.start(3)
	if step == 10:
		trans = 0
		$Timer2.start(30)
		step = 11
		$Fondu.start(0.02)
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 23
	if step == 9:
		$Node2D/Background8.set_visible(true)
		$Camera2D.offset.x = 0
		$Camera2D.offset.y = 0
		$Camera2D.zoom.x = 1
		$Camera2D.zoom.y = 1
		step = 10
		$Fondu.start(0.02)
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 22
		$Timer2.start(19)
	if step == 2:
		step = 3
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 20
		$Node2D/Obj.set_visible(false)
		$Node2D/Background.set_texture(image3)
		$Fondu.start(0.02)
	if step == 0:
		step = 1
		PlVar.i = 0
		PlVar.messf = ""
		PlVar.phase = 19
		$Fondu.start(0.02)
	
	pass # Replace with function body.


func _on_Fondu_timeout():
	if step == 15:
		$Black2.set_texture(white)
		Omni.goto_scene("res://Scenes/Other/Difficulte.tscn")
		step = 16
	pass # Replace with function body.



func _on_VideoPlayer_finished():
	Omni.goto_scene("res://Scenes/Other/Difficulte.tscn")
	step = 14
	pass # Replace with function body.
