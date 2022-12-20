extends Node
# warning-ignore:unused_class_variable
var vel = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 2
	PlVar.kelmus = 3
	PlVar.loop = 0
	$Node2D/player.global_position = Vector2(-285, 60)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == -2:
		$Node2D/vaisseau.set_animation("demarrage")
		PlVar.phase = -3
		PlVar.save_game()
		PlVar.chargement = 1
		$Timer.start(2)
		get_node("Node2D/2departdial/Decol").set_volume_db(PlVar.son + 25)
		get_node("Node2D/2departdial/Decol").play()
		pass
	pass


func _on_Timer_timeout():
	PlVar.chargement = 0
	Omni.goto_scene("res://Scenes/Maps/Clouds.tscn")
	pass # Replace with function body.
