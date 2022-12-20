extends Node
var cara = 0
var part = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 4
	PlVar.kelmus = 5
	PlVar.loop = 0
	if PlVar.scenario[4] == "0":
		PlVar.scenario[4] = "1"
		PlVar.chargement = 1
		PlVar.life = PlVar.diffveg
		PlVar.mana = PlVar.manamax
		PlVar.save_game()
		$Charge.start(1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.phase == -2:
		get_node("Node2D/dials/2shiprogdial/Decol").set_volume_db(PlVar.son + 25)
		get_node("Node2D/dials/2shiprogdial/Decol").play()
		$Node2D/vaisseau.set_animation("demarrage")
		PlVar.phase = -13
		$Timer.start(3)

	if PlVar.phase == 142 or PlVar.phase == 146:
		$Node2D/Progfer.set_animation("stress")
	elif PlVar.phase == 143 or PlVar.phase == 147:
		$Node2D/Progfer.set_animation("cara")
		if cara == 0:
			var b = part.instance()
			b.global_position = $Node2D/Progfer.global_position
			b.start(5, 0.2)
			get_parent().add_child(b)
			cara = 1
	elif PlVar.phase == 144 or PlVar.phase == 148:
		if cara == 1:
			var b = part.instance()
			b.global_position = $Node2D/Progfer.global_position
			b.start(5, 0.2)
			get_parent().add_child(b)
			cara = 0
			$Node2D/Progfer.set_animation("default")
	else:
		$Node2D/Progfer.set_animation("default")
	
	if PlVar.phase == 1387:
		get_node("Node2D/13883rock").visible = true
		get_node("Node2D/13883rock/0001388/CollisionShape2D").disabled = false
		get_node("Node2D/dials/0001384/CollisionShape2D").disabled = true
		
	pass


func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.


func _on_Timer_timeout():
	Omni.goto_scene("res://Scenes/Maps/Clouds.tscn")
	pass # Replace with function body.
