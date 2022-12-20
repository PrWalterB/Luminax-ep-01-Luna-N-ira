extends AnimatedSprite
var succ = 0
var part = preload("res://Scenes/Projectiles/Characters/projveg2.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_released("att03"):
		queue_free()
	pass


func _on_Area2D_body_entered(body):
	if "Head" in body.name:
		queue_free()
	if succ == 0:
		if "soldier" in body.name:
			#if PlVar.mana >= Stats.vegetstat[2][1][1]:
			#	queue_free()
			succ = 1
			var b = part.instance()
			b.global_position = $Position2D.global_position
			get_parent().call_deferred("add_child", b)
			$Timer.start(10)
			body.hit(rand_range(Stats.vegetstat[2][0][0], Stats.vegetstat[2][0][1]))
			queue_free()
			
		
	pass # Replace with function body.


func _on_Timer_timeout():
	succ = 0
	pass # Replace with function body.


func _on_protveg3_animation_finished():
	queue_free()
	pass # Replace with function body.
