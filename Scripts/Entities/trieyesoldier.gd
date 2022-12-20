extends KinematicBody2D
var dam = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if dam == 0:
		get_parent().set_animation("default")
	if dam == 1:
		get_parent().set_animation("dam")
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and dam == 0:
		PlVar.bosslife -= damage
		$Hit.start(1)
		for i in get_parent().get_parent().get_children():
			if "eye" in i.name:
				i.get_node("soldier").dam = 1
				
		dam = 1
	pass
	
func _on_Hit_timeout():
	for i in get_parent().get_parent().get_children():
			if "eye" in i.name:
				i.get_node("soldier").dam = 0
	dam = 0
	pass # Replace with function body.
