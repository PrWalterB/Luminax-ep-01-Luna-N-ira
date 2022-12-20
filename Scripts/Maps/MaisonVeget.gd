extends Node
var particule = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 0
	PlVar.kelmus = 0
	PlVar.loop = 0
	if PlVar.scenario[0] == "0":
		PlVar.tuto = 1
	$Node2D/DringTime.start(0.1)
	if PlVar.nextx == 43 and PlVar.nexty == 76:
		$Node2D/MGS.set_volume_db(PlVar.son + 15)
		$Node2D/MGS.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Node2D/Dring.set_volume_db(PlVar.son)
	if PlVar.scenario[0] == "1":
		$Node2D/walls/ActiveDoor.set_disabled(true)
		$Node2D/fleche0.supguide = 0
	if PlVar.phase >= 11 and PlVar.phase <= 17:
		$Node2D/Hologramme.set_animation("Progfer")
		$Node2D/fleche0.supguide = 0
	elif PlVar.phase >= 25 and PlVar.phase <= 29:
		$Node2D/Hologramme.set_animation("2Squares")
	else:
		$Node2D/Hologramme.set_animation("default")
	pass




func _on_DringTime_timeout():
	if PlVar.scenario[0] == "0":
		$Node2D/Dring.play()
		var c = particule.instance()
		c.global_position = $Node2D/DringPos.global_position
		c.start(7, 5)
		get_parent().add_child(c)
		$Node2D/DringTime.start(1)
	pass # Replace with function body.
