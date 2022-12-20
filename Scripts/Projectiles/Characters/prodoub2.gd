extends KinematicBody2D
var vel = Vector2()
var speed = 2
var lifboul = 30
var target = Vector2()
var moment = 0
var invu = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
# warning-ignore:unused_class_variable
var begin = preload("res://Sons/tornado.wav")
var end = preload("res://Sons/tornadoend.wav")

func _ready():
	$Son.set_volume_db(PlVar.son+10)
	$Son.play()
	$AnimatedSprite.play("send")
	$Timer.start(0.5)
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
	$Son.set_volume_db(PlVar.son+10)
	if invu == 0:
		if lifboul <= 0:
			$Son.stream = end
			$Son.play()
			moment = 2
			$AnimatedSprite.play("explode")
			$Timer.start(0.5)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		target = get_global_mouse_position()
		vel = (target - position).normalized() * speed
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "soldier" in body.name:
		 body.hit(rand_range(Stats.doubstat[1][0][0], Stats.doubstat[1][0][1]))
	pass # Replace with function body.
