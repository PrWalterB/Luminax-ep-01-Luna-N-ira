extends KinematicBody2D
var vel = Vector2()
var vel1 = Vector2()
var speed = 1
var lifboul = 1
var target = Vector2()
var moment = 1
var invu = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
var rotation_dir

func _ready():
	$active.start(1.5)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	if moment == 0:
		target = Vector2(-10000, global_position.y)
		vel = (target - position).normalized() * speed
	if moment == 1:
		target = get_global_mouse_position()
		vel1 = (target - position).normalized() * speed
		rotation_dir = vel1.angle()
		rotation = rotation_dir * speed
		vel = Vector2(speed, 0).rotated(rotation)
	var collision_info = move_and_collide(vel)
	if collision_info:
		vel = vel.bounce(collision_info.normal)
		lifboul -= 1
	pass

# warning-ignore:unused_argument
func _process(delta):
	$Son.set_volume_db(PlVar.son + 10)
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$AnimatedSprite.set_animation("explode")
			$Timer.start(1)
			invu = 1
			$Son.play()
			$Area2D/explode.set_disabled(false)
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		lifboul-= damage
	pass

func _on_Timer_timeout():
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "Asteroide" in body.name or "soldier" in body.name:
		body.hit(rand_range(Stats.vaistat[2][0][0], Stats.vaistat[2][0][1]))
	pass # Replace with function body.


func _on_active_timeout():
	$Area2D/CollisionShape2D.set_disabled(false)
	pass # Replace with function body.
