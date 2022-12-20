extends KinematicBody2D
var vel = Vector2()
var speed = 6
var lifboul = 1
var target = Vector2()
var moment = 0
var invu = 0
var type = ""
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")

func _ready():
	$SoundHit.set_volume_db(PlVar.son + 10)
	$SoundHit.play()
	$AnimatedSprite.play(type + "send")
	$Timer.start(0.0001)
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
	#if type == "p":
		#self.collision_mask = 5
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$SoundHit2.set_volume_db(PlVar.son + 10)
			$SoundHit2.play()
			$AnimatedSprite.play(type + "explode")
			$Timer.start(0.1)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play(type + "default")
		target = PlVar.player_pos
		vel = (target - position).normalized() * speed
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if type == "":
			body.hit(rand_range(10.5, 12.5))
		if type == "p":
			 body.hit(rand_range(12.5, 15.5))
	pass # Replace with function body.
