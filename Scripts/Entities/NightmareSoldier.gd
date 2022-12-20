extends Node2D
var mode = 0
var trans = 0
var boom = 0
#Name, Borders, Mov
var props = [["Neck/WideNeck/LongNeck/Head", -140, -235, 0], ["Neck/WideNeck/LongNeck", 77, 0, 0], ["Neck/WideNeck", 1.5, -40, 0], ["Pince2/Base/arm1/arm2/basepince/pince1", 90, 0, 0], ["Pince2/Base/arm1/arm2/basepince/pince2", 0, -90, 0], ["Pince1/Base/arm1/arm2/basepince/pince2", 0, -90, 0], ["Pince1/Base/arm1/arm2/basepince/pince1", 90, 0, 0], ["Pince2/Base/arm1/arm2/basepince", 51, -51, 0], ["Pince1/Base/arm1/arm2/basepince", 51, -51, 0], ["Pince1/Base/arm1/arm2", 21, -40, 0], ["Pince2/Base/arm1/arm2", 21, -40, 0], ["Pince2/Base/arm1", 60, 32, 0], ["Pince1/Base/arm1", 60, 32, 0]]
var masque = [["Neck/WideNeck/LongNeck/Head/maskup", 60, 0.5, 1, 0.001], ["Neck/WideNeck/LongNeck/Head/maskdown", -60, -0.5, -1, -0.001]]
var bouboule = preload("res://Scenes/Projectiles/Mobs/enproj2.tscn")
var particule = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Bouge.start(0.1)
	$Mov.start(0.01)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$sMEGALASER.set_volume_db(PlVar.son + (trans*25))
	if PlVar.pause == 0:
		$Bouge.set_paused(false)
		$Mov.set_paused(false)
		$GO.set_paused(false)
		$TRANS.set_paused(false)
		$ATT1.set_paused(false)
		$ATT2.set_paused(false)
	if PlVar.pause == 1:
		$Bouge.set_paused(true)
		$Mov.set_paused(true)
		$GO.set_paused(true)
		$TRANS.set_paused(true)
		$ATT1.set_paused(true)
		$ATT2.set_paused(true)
	$Neck/WideNeck/LongNeck/Head/eye/MEGALASER.set_modulate(Color(1, 1, 1, trans))
	if mode == 0 or mode == 1:
		if PlVar.bosslife <= (PlVar.maxbosslife/2) + (PlVar.maxbosslife/20):
			$ATT2.start(rand_range(10, 20))
			$Head.stream = load("res://Sons/Descend_Tunnmar.wav")
			$Head.set_volume_db(PlVar.son+35)
			$Head.stream_paused = false
			$Head.play()
			mode = 2
			
	if mode == 4:
		$Neck/WideNeck/LongNeck/Head/eye/MEGALASER/AnimatedSprite.set_animation("LASER")
		$Neck/WideNeck/LongNeck/Head/eye/MEGALASER/CollisionShape2D.set_disabled(false)
	else:
		$Neck/WideNeck/LongNeck/Head/eye/MEGALASER/AnimatedSprite.set_animation("default")
		$Neck/WideNeck/LongNeck/Head/eye/MEGALASER/CollisionShape2D.set_disabled(true)
	if mode != 7 and PlVar.bosslife <= 0:
		PlVar.save_succ(9)
		PlVar.get_node("Musique").stream_paused = true
		$Bouge.stop()
		$Mov.stop()
		$GO.stop()
		$TRANS.stop()
		$ATT1.stop()
		$ATT2.stop()
		get_parent().get_node("player/Black2").fondu(0.005, 0, 1)
		get_parent().bossend = 1
		$BOSSEND.start(3)
		mode = 7
		$toupeter.start(1)
	pass


func _on_Bouge_timeout():
	for i in props:
		i[3] = rand_range(-1.5, 1.5)
	$Bouge.start(rand_range(2.5, 5))
	pass # Replace with function body.


func _on_Mov_timeout():
	for i in props:
		if not ((mode == 2 or mode == 3 or mode == 4 or mode == 5)and "Neck" in i[0]):
			if get_node(i[0]).rotation_degrees > i[1] or get_node(i[0]).rotation_degrees < i[2]:
				i[3] = i[3]*-1
			get_node(i[0]).rotation_degrees += i[3]*PlVar.uldelta
		$Mov.start(0.01)
	if mode == 2:
		for i in masque:
			if (get_node(i[0]).rotation_degrees*i[3]) < (i[1]*i[3]):
				get_node(i[0]).rotation_degrees += i[2]*PlVar.uldelta
			else:
				$TRANS.start(0.01)
				$Neck/WideNeck/LongNeck/Head.look_at(PlVar.player_pos)
				mode = 3
				$sMEGALASER.stream_paused = false
				$Head.set_volume_db(PlVar.son+30)
				$Head.stream = load("res://Sons/Desc_Tunnmar.wav")
				$Head.play()
	if mode == 5:
		for i in masque:
			if (get_node(i[0]).rotation_degrees*i[3]) > (i[4]*i[3]):
				get_node(i[0]).rotation_degrees -= i[2]*PlVar.uldelta
			else:
				mode = 6
				$Head.set_volume_db(PlVar.son+30)
				$Head.stream = load("res://Sons/Activ_Tunnmar.wav")
				$Head.play()
				$ATT1.start(rand_range(8, 10))
	pass # Replace with function body.


func _on_GO_timeout():
	if self.global_position.x > 320:
		self.global_position.x -= 1*PlVar.uldelta
		$GO.start(0.01)
	pass # Replace with function body.


func _on_TRANS_timeout():
	if mode == 4:
		if trans > 0:
			trans -= 0.005*PlVar.uldelta
			$TRANS.start(0.01)
		else:
			mode = 5
			$sMEGALASER.stream_paused = true
			trans = 0
			$Head.stream = load("res://Sons/Descend_Tunnmar.wav")
			$Head.set_volume_db(PlVar.son+35)
			$Head.stream_paused = false
			$Head.play()
	if mode == 3:
		if trans < 1:
			trans += 0.01*PlVar.uldelta
			$TRANS.start(0.01)
		else:
			trans = 1
			mode = 4
	pass # Replace with function body.


func _on_MEGALASER_body_entered(body):
	if "player" in body.name:
		body.hit(rand_range(10, 15))
	pass # Replace with function body.


func _on_ATT1_timeout():
	if mode != 2:
		$Head.stream = load("res://Sons/Descend_Tunnmar.wav")
		$Head.set_volume_db(PlVar.son+35)
		$Head.stream_paused = false
		$Head.play()
	mode = 2
	pass # Replace with function body.


func _on_ATT2_timeout():
	var b = bouboule.instance()
	b.global_position = $Pince1/Base/arm1/arm2/basepince/Position2D.global_position
	b.type = "p"
	get_parent().add_child(b)
	var c = bouboule.instance()
	c.global_position = $Pince2/Base/arm1/arm2/basepince/Position2D.global_position
	c.type = "p"
	get_parent().add_child(c)
	$ATT2.start(rand_range(8, 10))
	pass # Replace with function body.


func _on_toupeter_timeout():
	if boom < 13:
		var b = particule.instance()
		b.position = get_node(props[boom][0]).global_position
		b.start(156, 1)
		get_parent().add_child(b)
		get_node(props[boom][0]).set_visible(false)
		boom += 1
		$toupeter.start(0.5)
	pass # Replace with function body.


func _on_BOSSEND_timeout():
	queue_free()
	pass # Replace with function body.


func _on_sMEGALASER_finished():
	$sMEGALASER.play()
	pass # Replace with function body.
