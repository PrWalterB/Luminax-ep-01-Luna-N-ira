extends Node2D
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var scin = 0
var ecoul = 0
var step = 0
var trans = 0
var image3 = preload("res://Sprites/Cinematics/Begin/back3.png")
var image12 = preload("res://Sprites/Cinematics/Begin/back12.png")
var image1 = preload("res://Sprites/Cinematics/Begin/back1.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.dialo = 1
	PlVar.phase = 18
	var b = dialogb.instance()
	add_child(b)
	$Timer.start(0.25)
	$Timer2.start(11)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if step == 1:
		$Node2D/Background.set_modulate(Color(1, 1, 1, 1-trans))
		if trans >= 1:
			step = 2
			$Timer2.start(6.7)
	if step == 3:
		$Node2D/Background.set_modulate(Color(1, 1, 1, 1-trans))
		if $Camera2D.zoom.x >= 1:
			step = 4
			PlVar.messf = ""
			PlVar.phase = 21
			trans = 0
			$Fondu.start(0.02)
	if step == 4:
		$Node2D/Background3.set_modulate(Color(1, 1, 1, 0+trans))
		if $Camera2D.offset.x >= 110:
			step = 5
			trans = 0
			$Fondu.start(0.02)
	if step == 5:
		$Node2D/Background4.set_modulate(Color(1, 1, 1, 0+trans))
		if $Camera2D.offset.y >= 260:
			step = 6
			trans = 0
			$Fondu.start(0.02)
	if step == 6:
		$Node2D/Background5.set_modulate(Color(1, 1, 1, 0+trans))
		if $Camera2D.offset.y <= 0:
			step = 7
			trans = 0
			$Fondu.start(0.02)
	if step == 7:
		$Node2D/Background6.set_modulate(Color(1, 1, 1, 0+trans))
		if $Camera2D.offset.y >= 260:
			step = 8
			trans = 0
			$Fondu.start(0.02)
	if step == 8:
		$Node2D/Background7.set_modulate(Color(1, 1, 1, 0+trans))
		if $Camera2D.offset.y <= -100:
			step = 9
			$Timer2.start(3)
			trans = 0
	if step == 11:
		$Node2D/Background9.set_modulate(Color(1, 1, 1, 0+trans))
	if step == 14:
		if $Node2D/Obj2.frame == 9:
			$Node2D/Black2.set_visible(true)
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
	if scin == 4:
		ecoul = 1
	if scin == 0:
		ecoul = 0
	if ecoul == 0:
		scin += 1
	if ecoul == 1:
		scin -= 1
	$Timer.start(0.25)
		
	pass # Replace with function body.


func _on_Timer2_timeout():
	if step == 13:
		$Camera2D.offset.x = 0
		$Camera2D.offset.y = 0
		$Camera2D.zoom.x = 1
		$Camera2D.zoom.y = 1
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
		PlVar.messf = ""
		PlVar.phase = 24
		$Timer2.start(3)
	if step == 10:
		trans = 0
		$Timer2.start(30)
		step = 11
		$Fondu.start(0.02)
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
		PlVar.messf = ""
		PlVar.phase = 22
		$Timer2.start(19)
	if step == 2:
		step = 3
		PlVar.messf = ""
		PlVar.phase = 20
		$Node2D/Obj.set_visible(false)
		$Node2D/Background.set_texture(image3)
		$Fondu.start(0.02)
	if step == 0:
		step = 1
		PlVar.messf = ""
		PlVar.phase = 19
		$Fondu.start(0.02)
	pass # Replace with function body.


func _on_Fondu_timeout():
	if step == 4:
		if trans <= 1:
			trans += 0.01
			$Fondu.start(0.02)
		if $Camera2D.offset.x <= 110:
			$Camera2D.offset.x += 1
	if step == 5:
		if trans <= 1:
			trans += 0.01
			$Fondu.start(0.02)
		if $Camera2D.offset.y <= 260:
			$Camera2D.offset.x += 1
			$Camera2D.offset.y += 2.36
	if step == 6:
		if trans <= 1:
			trans += 0.01
			$Fondu.start(0.02)
		if $Camera2D.offset.y >= 0:
			$Camera2D.offset.x += 1
			$Camera2D.offset.y -= 2.36
	if step == 7:
		if trans <= 1:
			trans += 0.01
			$Fondu.start(0.02)
		if $Camera2D.offset.y <= 260:
			$Camera2D.offset.x += 1
			$Camera2D.offset.y += 2.36
	if step == 8:
		if trans <= 1:
			trans += 0.01
			$Fondu.start(0.02)
		if $Camera2D.offset.y >= -100:
			$Camera2D.offset.y -= 2.36
			$Camera2D.zoom.x -= 0.00005
			$Camera2D.zoom.y -= 0.00005
	if step == 10:
		$Camera2D.zoom.x -= 0.0002
		$Camera2D.zoom.y -= 0.0002
		$Fondu.start(0.02)
	if step == 11:
		if $Camera2D.zoom.x <= 1:
			$Camera2D.zoom.x += 0.0002
			$Camera2D.zoom.y += 0.0002
		if trans <= 1:
			trans += 0.01
		$Fondu.start(0.02)
	if step == 3:
		if trans >= -0.5:
			trans -= 0.01
	if step == 3:
		$Camera2D.zoom.x += 0.0005
		$Camera2D.zoom.y += 0.0005
		$Fondu.start(0.02)
	if step == 1:
		trans += 0.01
	if step == 1 or step == 2:
		$Camera2D.zoom.x -= 0.001
		$Camera2D.zoom.y -= 0.001
		$Fondu.start(0.02)
	
	pass # Replace with function body.

