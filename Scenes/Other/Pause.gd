extends CanvasLayer
var options = preload("res://Scenes/Other/Options.tscn")
var succes = preload("res://Scenes/Other/Succes.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var backload = PlVar.get_gui_lang()
	$Button.text = backload[0]
	$Options.text = backload[1]
	$Succes.text = backload[65]
	$Quitter.text = backload[2]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	var backload = PlVar.get_gui_lang()
	$Button.text = backload[0]
	$Options.text = backload[1]
	$Succes.text = backload[65]
	$Quitter.text = backload[2]
	if PlVar.map == -1:
		$Options.set_disabled(true)
		$Options.set_visible(false)
		$Succes.set_disabled(true)
		$Succes.set_visible(false)
		var butpos = Vector2()
		butpos.x = 170
		butpos.y = 280
		$Quitter.set_position(butpos)
	else:
		$Options.set_disabled(false)
		$Options.set_visible(true)
		$Succes.set_disabled(false)
		$Succes.set_visible(true)
		var butpos = Vector2()
		butpos.x = 170
		butpos.y = 370
		$Quitter.set_position(butpos)
	
	if PlVar.pause == 0:
		queue_free()
	pass


func _on_Button_pressed():
	PlVar.menutime = 0
	PlVar.pause = 0
	pass # Replace with function body.


func _on_Quitter_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Options_pressed():
	var b = options.instance()
	get_parent().add_child(b)
	pass # Replace with function body.


func _on_Succes_pressed():
	var b = succes.instance()
	get_parent().add_child(b)
	pass # Replace with function body.
