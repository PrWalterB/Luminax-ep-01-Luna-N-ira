extends Node2D

var tronc
var leaves

# Called when the node enters the scene tree for the first time.
func _ready():
	tronc = int(rand_range(0, 3.5))
	leaves = int(rand_range(0, 3.5))
	
	get_node("walls/" + str(tronc)).set_disabled(false)
	$back.set_animation(str(tronc))
	$front.set_animation(str(tronc))
	$leaves.set_animation(str(leaves))
	$shadow.set_animation(str(leaves))
	if leaves == 3:
		$leaves.position.y = -124
	elif leaves == 0:
		$leaves.position.y = -70
	else:
		$leaves.position.y = -150
	
	tronc = int(rand_range(0, 1))
	leaves = int(rand_range(0, 1))
	if tronc == 0:
		tronc = -1
	if leaves == 0:
		leaves = -1
	leaves = leaves * 1.5
	$back.scale.x = tronc
	$front.scale.x = tronc
	$walls.scale.x = tronc
	$leaves.scale.x = leaves
	$shadow.scale.x = leaves
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
