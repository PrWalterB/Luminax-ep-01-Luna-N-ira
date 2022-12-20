extends KinematicBody2D
var vel = Vector2()
var vel1 = Vector2()
var speed = 1
var lifboul = 3
var target = Vector2()
var moment = 0
var invu = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
var sigma = preload("res://Scenes/Entities/sigma.tscn")
var rotation_dir

func _ready():
	#$AnimatedSprite.play("send")
	$Timer.start(1)
	$active.start(1.5)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if moment == 0:
			target = Vector2(global_position.x, -10000)
			vel = (target - position).normalized() * speed
			look_at(Vector2(global_position.x, -10000))
		if moment == 1:
			self.z_index = 0
			target = PlVar.player_pos
			target.y = PlVar.player_pos.y + 16
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
			$AnimatedSprite.play("explode")
			self.scale = Vector2(0.5, 0.5)
			self.z_index = 2
			$Son.play()
			$Timer.start(0.5)
			invu = 1
			$Area2D/explode.set_disabled(false)
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		lifboul-= damage
	pass

func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		target = PlVar.player_pos
		vel = (target - position).normalized() * speed
		$Timer.start(0.1)
	if moment == 2:
		var c = sigma.instance()
		c.global_position = self.global_position
		get_parent().add_child(c)
		queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "player" in body.name or "soldier" in body.name:
		 body.hit(rand_range(10.5, 15.5))
	pass # Replace with function body.


func _on_active_timeout():
	$Area2D/CollisionShape2D.set_disabled(false)
	pass # Replace with function body.
