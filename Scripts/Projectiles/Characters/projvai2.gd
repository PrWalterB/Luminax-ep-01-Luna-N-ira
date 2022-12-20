extends KinematicBody2D
var lifboul = 2
var moment = 0
var invu = 0
var sExplo = preload("res://Sons/Att1_2.wav")

func _ready():
	if PlVar.mana < 0.1:
		self.scale = Vector2(0.5, 0.5)
	$AnimatedSprite.play("send")
	$Timer.start(0.1)
	$Timer2.start(8)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	global_position.y = PlVar.player_pos.y
	global_position.x = PlVar.player_pos.x - 30
	pass

# warning-ignore:unused_argument
func _process(delta):
	$Son.set_volume_db(PlVar.son)
	if invu == 0:
		if lifboul <= 0:
			moment = 2
			$Son.stream = sExplo
			$Son.play()
			$AnimatedSprite.play("explode")
			$Timer.start(0.1)
			invu = 1
		if lifboul == 1:
			$AnimatedSprite.set_animation("end")
	pass


func _on_Timer_timeout():
	if moment == 0:
		moment = 1
		$AnimatedSprite.play("default")
		$Timer.start(0.1)
	if moment == 2:
		queue_free()
	pass # Replace with function body.

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	if body.name == "projen1":
		body.lifboul = 0
	pass # Replace with function body.


func _on_Timer2_timeout():
	lifboul -= 1
	if lifboul == 1:
		$Timer2.start(2)
	pass # Replace with function body.
