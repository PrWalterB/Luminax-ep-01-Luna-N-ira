extends KinematicBody2D
var vel = Vector2()
var speed = 6
var lifboul = 1
# warning-ignore:unused_class_variable
var target = Vector2()
var moment = 0
var invu = 0
var type = ""
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
# warning-ignore:RETURN_VALUE_DISCARDED
func _ready():
	look_at(get_parent().get_node("Vaisseaux").global_position)
	vel = Vector2(speed, 0).rotated(rotation)
	move_and_slide(vel)
	$AnimatedSprite.play(type + "send")
	$Timer.start(0.0001)
	$Timer2.start(15)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	var collision_info = move_and_collide(vel)
	
	if collision_info:
		vel = vel.bounce(collision_info.normal)
		lifboul -= 1
	pass

# warning-ignore:unused_argument
func _process(delta):
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$AnimatedSprite.play(type + "explode")
			$Timer.start(0.1)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play(type + "default")
		look_at(get_parent().get_node("Vaisseaux").global_position)
		vel = Vector2(speed, 0).rotated(rotation)
		# warning-ignore:RETURN_VALUE_DISCARDED
		move_and_slide(vel)
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if type == "":
			body.hit(rand_range(1, 1.5))
	pass # Replace with function body.


func _on_Timer2_timeout():
	queue_free()
	pass # Replace with function body.
