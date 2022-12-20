extends Node2D
var mode = 0
var proj = preload("res://Scenes/Projectiles/Mobs/enprojwasp.tscn")
#Name, Borders, Mov
var props = [["arm1", 148, -32, 0, 32], ["arm1/arm2", 90, -90, 0, 60], ["arm1/arm2/missy", 223, 136, 0, 0]]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Bouge.start(0.1)
	$Mov.start(0.01)
	$ATT.start(rand_range(1, 5))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 0:
		$Bouge.set_paused(false)
		$Mov.set_paused(false)
		$ATT.set_paused(false)
	if PlVar.pause == 1:
		$Bouge.set_paused(true)
		$Mov.set_paused(true)
		$ATT.set_paused(true)
	if mode == 1:
		$arm1/arm2/missy.look_at(PlVar.player_pos)
		if ($arm1.rotation_degrees <= 33 and $arm1.rotation_degrees >= 31) and ($arm1/arm2.rotation_degrees <= 61 and $arm1/arm2.rotation_degrees >= 59):
			var b = proj.instance()
			get_parent().add_child(b)
			b.mode = 1
			b.global_position = $arm1/arm2/missy/Position2D.global_position
			mode = 2
			$ATT.start(1)
	pass


func _on_Bouge_timeout():
	for i in props:
		i[3] = rand_range(-0.5, 0.5)
	$Bouge.start(rand_range(2.5, 5))
	pass # Replace with function body.


func _on_Mov_timeout():
	for i in props:
		if (get_node(i[0]).rotation_degrees > i[1] or get_node(i[0]).rotation_degrees < i[2]) and mode == 0:
			i[3] = i[3]*-1
		if get_node(i[0]).rotation_degrees > i[4] and mode == 1:
			i[3] = -1
		if get_node(i[0]).rotation_degrees < i[4] and mode == 1:
			i[3] = 1
		get_node(i[0]).rotation_degrees += i[3]
		$Mov.start(0.01)
	pass # Replace with function body.


func _on_ATT_timeout():
	if mode == 0:
		mode = 1
		$Bouge.stop()
		pass
	if mode == 2:
		mode = 0
		$Bouge.start(rand_range(2.5, 5))
		$ATT.start(rand_range(1, 20))
	pass # Replace with function body.
