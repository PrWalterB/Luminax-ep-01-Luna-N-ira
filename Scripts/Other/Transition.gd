extends Area2D
var map
var dirmap = ""
var dirx = ""
var diry = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	dirmap = name.right(8)
	dirx = name[0] + name[1] + name[2] + name[3]
	diry = name[4] + name[5] + name[6] + name[7]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	map = PlVar.map
	pass


func _on_Transition_body_entered(body):
	if body.name == "player":
		Omni.goto_scene("res://Scenes/Maps/"+dirmap+".tscn")
		PlVar.nextx = int(dirx)
		PlVar.nexty = int(diry)
	pass # Replace with function body.
