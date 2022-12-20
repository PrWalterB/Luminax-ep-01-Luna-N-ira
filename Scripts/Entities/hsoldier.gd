extends KinematicBody2D
var mode = 0
# warning-ignore:unused_class_variable
var target = Vector2()
var vel = Vector2()
var speed = 0
var proj = preload("res://Scenes/Projectiles/Mobs/hproj.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(1.5,1.5)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 1:
		$Timer.paused = true
	if PlVar.pause == 0:
		$Timer.paused = false
	look_at(get_parent().get_parent().get_node("Vaisseaux").global_position)
	vel = Vector2(speed, 0).rotated(rotation)
	# warning-ignore:RETURN_VALUE_DISCARDED
	move_and_slide(vel)
	if PlVar.phaction == 119:
		get_parent().get_parent().get_node("Vaisseaux").visible == true
	if mode == 0 and PlVar.phaction == 120:
		speed = 15
		$Timer.start(20)
		mode = 1
	if mode == 2 and PlVar.phaction == 136:
		speed = -15
		$Timer.start(5)
		mode = 3
	if PlVar.phaction == 140:
		$AnimatedSprite.animation = "shield"
		$CollisionPolygon2D.disabled = false
	if mode == 5:
		$Timer.start(0.0001)
		mode = 6
	if PlVar.phaction == 174:
		PlVar.save_succ(10)
		$CollisionPolygon2D.disabled = true
		speed = -30
	pass


func _on_Timer_timeout():
	if mode == 1:
		speed = 0
		mode = 2
	if mode == 3:
		speed = 0
		mode = 4
	if mode == 6:
		var b = proj.instance()
		get_parent().get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		$Timer.start(0.2)
	pass # Replace with function body.

# warning-ignore:unused_argument
func hit(damage):
	pass
