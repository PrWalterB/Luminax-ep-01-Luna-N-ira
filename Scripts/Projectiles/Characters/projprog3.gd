extends KinematicBody2D
var vel = Vector2()
var speed = 3
var lifboul = 3
var target = Vector2()
var moment = 0
# warning-ignore:unused_class_variable
var invu = 0
# warning-ignore:unused_class_variable
var caradeg = 0
var retoorn = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")

func _ready():
	PlVar.nbcara += 1
	if PlVar.nbcara > 1:
		queue_free()
		PlVar.nbcara -= 1
	$AnimatedSprite.play("send")
	$Timer.start(0.1)
	$retourne.start(3)
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
	
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		if retoorn == 0:
			target = get_global_mouse_position()
			vel = (target - position).normalized() * speed
			$Timer.start(0.1)
	if moment == 2:
		PlVar.nbcara -= 1
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "soldier" in body.name:
		body.hit(PlVar.caradeg*Stats.progferstat[2][0][0] + Stats.progferstat[2][0][1])
	if body.name == "champlife":
		if retoorn == 1:
			moment = 2
			PlVar.retoorn = retoorn
			$AnimatedSprite.play("explode")
			$Timer.start(0.1)
	pass # Replace with function body.


func _on_retourne_timeout():
	retoorn = 1
	$veg.set_disabled(true)
	target = PlVar.vel
	vel = (target - position).normalized() * speed
	pass # Replace with function body.
