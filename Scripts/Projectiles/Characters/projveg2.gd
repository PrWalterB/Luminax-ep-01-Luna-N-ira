extends KinematicBody2D
var vel = Vector2()
var speed = 3
var lifboul = 1
var target = Vector2()
var moment = 0
var invu = 0
var life = 0
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")

func _ready():
	if PlVar.mana >= Stats.vegetstat[2][1][1]:
		PlVar.mana -= Stats.vegetstat[2][1][1]
	print(Stats.vegetstat[2][1][1])
	print(PlVar.mana)
	$AnimatedSprite.play("send")
	$Timer.start(0.6)
	scale.x = rand_range(0.1, 0.5)
	scale.y = scale.x
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
	if lifboul > 0:
		target = PlVar.vel
		vel = (target - position).normalized() * speed
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$AnimatedSprite.play("explode")
			$Timer.start(0.6)
			invu = 1
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		
		$Timer.start(0.6)
	if moment == 2:
		queue_free()
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_Area2D_body_entered(champlife):
	life = PlVar.life
	champlife.get_parent().get_node("SoundAttaque").stream = load("res://Sons/volvie.wav")
	champlife.get_parent().get_node("SoundAttaque").play()
	if life < PlVar.diffveg:
		life += rand_range(0.1, 0.3)
	PlVar.life = life
	queue_free()
	pass # Replace with function body.
