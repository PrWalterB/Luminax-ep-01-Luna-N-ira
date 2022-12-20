extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.dialo = 0
	PlVar.pause = 0
	PlVar.map = 9
	if PlVar.scenario[12] == "0":
		PlVar.scenario[12] = "1"
		PlVar.save_game()
		PlVar.chargement = 1
		$Charge.start(3)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == -2:
		PlVar.phase = -23
		$Timer.start(3)
	if PlVar.phase == 1398:
		get_node("13993water/0001399/CollisionShape2D").disabled = false
		get_node("13993water").visible = true
		get_node("Node2D/dials/0001396/CollisionShape2D").disabled = true
	pass


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_Timer_timeout():
	Omni.goto_scene("res://Scenes/Cinematics/AnimPartBunker.tscn")
	pass # Replace with function body.
