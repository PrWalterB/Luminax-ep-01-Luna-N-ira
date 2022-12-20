extends KinematicBody2D
var vel = Vector2()
var speed = 3
var lifboul = 1
# warning-ignore:unused_class_variable
var target = Vector2()
# warning-ignore:unused_class_variable
var moment = 0
var invu = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")

func _ready():
	
	rotation = rand_range(4.3, 5.3)
	scale.x = rand_range(1.01, 2.01)
	scale.y = scale.x
	$Son.set_volume_db(PlVar.son+(5*scale.x))
	$Son.play()
	vel =  Vector2(-speed, 0).rotated(rotation)
	$AnimatedSprite.play("default")
	$Timer.start(1.2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	var collision_info = move_and_collide(vel)
	if collision_info:
		lifboul -= 1
	pass

# warning-ignore:unused_argument
func _process(delta):
	if invu == 0:
		if lifboul <= 0:
			queue_free()
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "soldier" in body.name:
		body.hit(rand_range(Stats.togstat[1][0][0], Stats.togstat[1][0][1]))
	pass # Replace with function body.
