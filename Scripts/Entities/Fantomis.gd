extends Node2D
var phaser = "0"
var trans = 1
var caca = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = self.name.right(5)
	phaser = self.name.left(4)
	print(anim)
	$AnimatedSprite.set_animation(anim)
	get_node("0001374").name = "000" + phaser
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.map != 0 and caca == 0:
		if PlVar.map != 5 or PlVar.map != 12:
			get_node("000" + phaser + "/CollisionShape2D").disabled = true
		if (PlVar.map == 10 or PlVar.map == 11) and (OS.get_datetime()["hour"] == 16 or OS.get_datetime()["hour"] == 22 or OS.get_datetime()["hour"] == 4 or OS.get_datetime()["hour"] == 10):
			get_node("000" + phaser + "/CollisionShape2D").disabled = false
		caca = 1
	self.modulate = Color(1,1,1,trans)
	if PlVar.phase == int(phaser) + int(name[4]):
		get_node("000" + phaser + "/CollisionShape2D").disabled = true
		PlVar.manamax += 10
		$Timer.start(0.001)
	pass


func _on_Timer_timeout():
	if trans >= 0:
		trans -= 0.001*PlVar.uldelta
		$Timer.start(0.0005)
	pass # Replace with function body.
