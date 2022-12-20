extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var step = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.dialo = 1
	$Node2D/player.global_position = Vector2(511,433)
	$Node2D/player.z_index = -20
	PlVar.phase = 1308
	var backload = PlVar.get_gui_lang()
	$Label.text = backload[80]
	var b = dialogb.instance()
	add_child(b)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	PlVar.zoom = 0.45
	PlVar.dialo = 1
	if step == 0 and PlVar.phase == 1313:
		$Timer.start(0.001)
		step = 1
	if step == 2:
		PlVar.phase = 1314
		PlVar.allow = 0
		var b = dialogb.instance()
		add_child(b)
		step = 3
		$Node2D/Doublix.set_animation("default")
	if PlVar.phase == 1351:
		$Timer2.start(6)
		$Node2D/player/Black2.fondu(0.005, 0)
	pass


func _on_Timer_timeout():
	if step == 1 and $Node2D/Doublix.global_position.y > 435:
		$Node2D/Doublix.global_position.y -= 0.5*PlVar.uldelta
		$Timer.start(0.001)
	elif step != 2 and step != 3:
		step = 2
	pass # Replace with function body.


func _on_Timer2_timeout():
	if $Label.visible == true:
		PlVar.dialo = 0
		PlVar.reset_game()
	if $Label.visible == false:
		$Label.visible = true
		$Sprite.visible = true
		$Node2D/player/Black2.fondu(-0.005, 0)
		$Timer2.start(10)
	pass # Replace with function body.
