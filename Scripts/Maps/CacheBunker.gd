extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.save_succ(53)
	$Node2D/player.position = Vector2(524,326)
	PlVar.dialo = 0
	PlVar.phase = 0
	PlVar.get_node("Musique").stream_paused = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_06070933Bunker_body_entered(body):
	PlVar.get_node("Musique").stream_paused = false
	pass # Replace with function body.
