extends AnimatedSprite

var state = 0
var sig = 0
var sigma = preload("res://Scenes/Entities/sigma.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if state == 1 and self.frame > 5:
		$Area2D/CollisionShape2D.set_disabled(true)
	pass


func _on_Area2D_body_entered(body):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if body.name == "player":
			 body.hit(rand_range(3, 5.5))
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if state == 1:
		sig = rand_range(0, 100)
		if sig < 10:
			var c = sigma.instance()
			c.global_position = global_position
			get_parent().add_child(c)
		queue_free()
	if state == 0:
		self.play("att")
		$Area2D/CollisionShape2D.set_disabled(false)
		state = 1
		pass
	pass # Replace with function body.
