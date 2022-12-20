extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.save_succ(23)
	$player.position = Vector2(501, 306)
	PlVar.dialo = 1
	var backload = PlVar.get_gui_lang()
	$Label.text = backload[82]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	PlVar.zoom = 0.45
	if Input.is_action_pressed("ui_cancel"):
		PlVar.dialo = 0
		PlVar.reset_game()
	pass


func _on_VideoPlayer_finished():
	$VideoPlayer.visible = false
	pass # Replace with function body.
