extends KinematicBody2D
# warning-ignore:unused_class_variable
var lifsol = 5*PlVar.diffpro
var mode = 0
var target
var vel = Vector2()
# warning-ignore:unused_class_variable
var dam = 0
var proj = preload("res://Scenes/Projectiles/Mobs/enproj2.tscn")
# warning-ignore:unused_class_variable
var sigma = preload("res://Scenes/Entities/sigma.tscn")
# warning-ignore:unused_class_variable
var particule = preload("res://Scenes/Other/particle.tscn")
# warning-ignore:unused_class_variable
var nbsig = 5
# warning-ignore:unused_class_variable
var mort = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(2)
	$signn.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if mode == 0:
		$AnimatedSprite.set_animation("prepare")
	if mode == 1:
		$AnimatedSprite.play("shoot")
		mode = 2
	if PlVar.pause == 0 and PlVar.dialo == 0:
		$Timer.paused = false
		target = Vector2(self.global_position.y, -10000)
		vel = (target - position).normalized() * 80
		# warning-ignore:return_value_discarded
		move_and_slide(vel)
	else:
		$Timer.paused = true
	pass


func _on_Timer_timeout():
	if mode == 0:
		mode += 1
		$Timer.stop()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if mode == 2 and $AnimatedSprite.animation == "shoot":
		var b = proj.instance()
		get_parent().add_child(b)
		b.global_position = self.global_position
		mode = 3
		$AnimatedSprite.set_animation("default")
	pass # Replace with function body.


func _on_sign_animation_finished():
	$signn.queue_free()
	pass # Replace with function body.
