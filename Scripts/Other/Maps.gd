extends Node
var playor = preload("res://Scenes/Player/player.tscn")
var mousse = preload("res://Scenes/Player/mouse.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var b = playor.instance()
	b.global_position = $spawn.global_position
	get_parent().add_child(b)
	var c = mousse.instance()
	get_parent().add_child(c)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
