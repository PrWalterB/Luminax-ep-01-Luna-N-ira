extends StaticBody2D
var al1 = rand_range(0, 1)
var al2 = rand_range(0, 1)
var al3 = rand_range(0, 1)
var dead = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if al1 > 0.5:
		al1 = rand_range(0.00000, 1.00000)
	else: 
		al1 = 1
	if al2 > 0.5:
		al2 = rand_range(0.00000, 1.00000)
	else: 
		al2 = 1
	if al3 > 0.5:
		al3 = rand_range(0.00000, 1.00000)
	else: 
		al3 = 1
	$AnimatedSprite.set_self_modulate(Color(al1, al2, al3, 1))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	if dead == 0:
		$AnimatedSprite.set_animation("dead")
		get_node("0000168/CollisionShape2D").set_disabled(true)
		dead = 1
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if dead == 1:
		$AnimatedSprite._set_playing(false)
		$AnimatedSprite.frame = 3
	pass # Replace with function body.
