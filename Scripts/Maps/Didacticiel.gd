extends Node
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var sol = preload("res://Scenes/Entities/soldier.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 868
	PlVar.phase = 1453
	var b = dialogb.instance()
	add_child(b)
	PlVar.dialo = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlVar.dialo == 1:
		get_node("Node2D/faces/face" + str(PlVar.phase)).visible = true
		for i in $Node2D/faces.get_children():
			if not str(PlVar.phase) in i.name:
				i.visible = false
	else:
		for i in $Node2D/faces.get_children():
			i.visible = false
	if PlVar.phase == 1459:
		$Node2D/Points/point1.visible = true
	if PlVar.phase == 1460:
		$Node2D/Points/point1.visible = false
		get_node("Node2D/Points/1Didacdial/CollisionShape2D").disabled = true
		$Node2D/player.position = Vector2(505,297)
	if PlVar.phase == 1470:
		$Node2D/Points/point2.visible = true
		var b = sol.instance()
		b.position = $Node2D/Points/Position2D.position
		$Node2D.add_child(b)
	if PlVar.kill[0] == 1:
		PlVar.kill[0] = 0
		$Node2D/Points/point2.visible = false
		$Node2D/player.position = Vector2(505,297)
		PlVar.phase = 1471
		var b = dialogb.instance()
		add_child(b)
		PlVar.dialo = 1
	if PlVar.phase == 1481:
		PlVar.dialo = 2
		PlVar.phase = 0
		PlVar.i = 0
		PlVar.pause = 0
		PlVar.nextmap = 0
		PlVar.nextx = 47
		PlVar.nexty = 11
		Omni.goto_scene("res://Scenes/Other/Menu.tscn")
	pass
