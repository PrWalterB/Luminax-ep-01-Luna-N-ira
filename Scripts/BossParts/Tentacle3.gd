extends KinematicBody2D
var rotation_dir
# warning-ignore:unused_class_variable
var speed = -2
var vel = Vector2()
# warning-ignore:unused_class_variable
var target
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if name == "Tentacle3" and (PlVar.map == 20 or PlVar.map == 21) or PlVar.map == 7:
		vel = (get_parent().get_node("soldier").position - position).normalized()
		scale.x = sqrt(pow(get_parent().get_node("soldier").global_position.x-global_position.x, 2)+pow(get_parent().get_node("soldier").global_position.y-global_position.y, 2))/30
	if name == "Tentacle4" and (PlVar.map == 20 or PlVar.map == 21):
		vel = (get_parent().get_node("soldier2").position - position).normalized()
		scale.x = sqrt(pow(get_parent().get_node("soldier2").global_position.x-global_position.x, 2)+pow(get_parent().get_node("soldier2").global_position.y-global_position.y, 2))/30
	if PlVar.map == 22:
		vel = (get_parent().get_parent().get_node("PNJ2/00OlgaEnd0").global_position - global_position).normalized()
		scale.x = sqrt(pow(get_parent().get_parent().get_node("PNJ2/00OlgaEnd0").global_position.x-global_position.x, 2)+pow(get_parent().get_parent().get_node("PNJ2/00OlgaEnd0").global_position.y-global_position.y, 2))/30
		
	
	rotation_dir = vel.angle()
	rotation = rotation_dir
	pass
