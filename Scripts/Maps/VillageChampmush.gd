extends Node
# warning-ignore:unused_class_variable
var vel = Vector2()
var excl = 0
var particule = preload("res://Scenes/Other/particle.tscn")
var soldat = preload("res://Scenes/Entities/soldier.tscn")
var spawn = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = 1
	PlVar.kelmus = 1
	PlVar.loop = 0
	$MGS.set_volume_db(PlVar.son + 15)
	$Node2D/fleche0.supguide = 0
	if PlVar.nextx == 1265 and PlVar.nexty == 534:
		$MGS.stream = load("res://Sons/OpenDoor.wav")
		$MGS.play()
		PlVar.save_succ(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.scenario[2] == "1":
		$Node2D/fleche0.supguide = 1
		$Node2D/walls/barriercoll.set_disabled(true)
		$Node2D/barriers/AnimatedSprite.play("down")
		$Node2D/PNJsoldier.set_visible(false)
		$Node2D/PNJsoldier2.set_visible(false)
		$Node2D/PNJsoldier3.set_visible(false)
		$Node2D/Ombre2.set_visible(false)
		$Node2D/Ombre3.set_visible(false)
		$Node2D/Ombre4.set_visible(false)
		get_node("Node2D/1soldial/CollisionShape2D").set_disabled(true)
	if PlVar.scenario[2] == "0":
		if PlVar.kill[0] == 3:
			PlVar.chargement = 1
			$Charge.start(1)
			$Node2D/fleche0.supguide = 1
			PlVar.scenario[2] = "1"
			PlVar.kill[0] = 0
			PlVar.save_game()
	if (PlVar.phase >= 42 and PlVar.phase <= 58) or (PlVar.phase >= 34 and PlVar.phase <= 35):
		$Node2D/PNJrasta.set_animation("talk")
	else:
		$Node2D/PNJrasta.set_animation("default")
	if PlVar.phase >= 59 and PlVar.phase <= 63:
		$Node2D/PNJsoldier.stop()
		$Node2D/PNJsoldier2.stop()
		$Node2D/PNJsoldier3.stop()
		if excl == 0:
			PlVar.kelmus = 2
			PlVar.loop = 0
			$MGS.set_volume_db(PlVar.son + 15)
			$MGS.stream = load("res://Sons/Excla.wav")
			$MGS.play()
			var b = particule.instance()
			b.global_position = $Node2D/PNJsoldier.global_position
			b.start(8, 0.5)
			add_child(b)
			var c = particule.instance()
			c.global_position = $Node2D/PNJsoldier2.global_position
			c.start(8, 0.5)
			add_child(c)
			var d = particule.instance()
			d.global_position = $Node2D/PNJsoldier3.global_position
			d.start(8, 0.5)
			add_child(d)
			excl = 1
	if PlVar.phase == 63:
		$Node2D/PNJsoldier.set_visible(false)
		$Node2D/PNJsoldier2.set_visible(false)
		$Node2D/PNJsoldier3.set_visible(false)
		$Node2D/Ombre2.set_visible(false)
		$Node2D/Ombre3.set_visible(false)
		$Node2D/Ombre4.set_visible(false)
		if spawn == 0:
			PlVar.kelmus = 3
			PlVar.loop = 0
			var pos1 = $Node2D/PNJsoldier.global_position
			var pos2 = $Node2D/PNJsoldier2.global_position
			var pos3 = $Node2D/PNJsoldier3.global_position
			pos1.y -= 16
			pos2.y -= 16
			pos3.y -= 16
			var b = soldat.instance()
			b.global_position = pos1
			add_child(b)
			var c = soldat.instance()
			c.global_position = pos2
			add_child(c)
			var d = soldat.instance()
			d.global_position = pos3
			add_child(d)
			spawn = 1
	if PlVar.phase == 1372:
		get_node("Node2D/13749irony").visible = true
		get_node("Node2D/13749irony/0001374/CollisionShape2D").disabled = false
	if PlVar.phase == 1374:
		PlVar.save_succ(22)
	pass

func _on_Charge_timeout():
	PlVar.chargement = 0
	pass # Replace with function body.
