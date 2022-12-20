extends StaticBody2D
var type
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	type = rand_range(0, 12)
	type = int(type)
	$AnimatedSprite.set_animation(str(type))
	get_node(str(type)).set_disabled(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

