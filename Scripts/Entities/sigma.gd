extends KinematicBody2D
var vel = Vector2()
var target = Vector2()
var stade = 0
var rotation_dir = randi()
var particule = preload("res://Scenes/Other/particle.tscn")
var speed = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stop.start(2)
	speed = rand_range(100, 150)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if stade == 0:
		rotation += rotation_dir * speed
		vel = Vector2(50, 0).rotated(rotation)
	if stade == 1:
		target = PlVar.player_pos
		vel = (target - position).normalized() * speed
	# warning-ignore:return_value_discarded
	move_and_slide(vel)
	pass


func _on_coll_body_entered(body):
	if "player" in body.name or "champlife" in body.name:
		if PlVar.mort == 0:
			PlVar.mana += rand_range(2.5, 3.5)
			$Timer.start(0.0001)
		if "walls" in body.name:
			var c = particule.instance()
			c.global_position = $coll.global_position
			c.start(10, 0.25)
			get_parent().add_child(c)
			queue_free()
	pass # Replace with function body.


func _on_aire_body_entered(body):
	if PlVar.mort == 0:
		if "player" in body.name:
			speed = rand_range(100, 150)
			stade = 1
	pass # Replace with function body.



func _on_Timer_timeout():
	var c = particule.instance()
	c.global_position = $coll.global_position
	c.start(10, 0.25)
	get_parent().add_child(c)
	queue_free()
	pass # Replace with function body.


func _on_Stop_timeout():
	if stade != 1:
		speed = 0
	pass # Replace with function body.
