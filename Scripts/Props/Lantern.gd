extends Node2D
var trans = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.set_animation(str(int(rand_range(0, 1))))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	trans = 1/(global_position.distance_to(PlVar.player_pos)/40)
	if trans > 1:
		trans = 1
	if PlVar.scenario[16] != "1":
		trans = 0
	self.modulate = Color(1,1,1, trans)
	pass
