extends KinematicBody2D
# warning-ignore:unused_class_variable
var dam = 0
var deg = 0
var pers
var hurt1 = preload("res://Sons/Boss1Hurt1.wav")
var hurt2 = preload("res://Sons/Boss1Hurt2.wav")
var hurt3 = preload("res://Sons/Boss1Hurt4.wav")
var chooseS = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$OrganS.set_volume_db(PlVar.son + 20)
	pass
	

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		chooseS = rand_range(0, 3)
		if chooseS < 1:
			$OrganS.stream = hurt1
		elif chooseS > 2:
			$OrganS.stream = hurt3
		else:
			$OrganS.stream = hurt2
		$OrganS.play()
		PlVar.bosslife -= damage
		$Sprite.set_animation("hurt")
		$Hit.start(0.1)
		
	pass

func _on_Hit_timeout():
	$Sprite.set_animation("default")
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if PlVar.pause == 0 and PlVar.dialo == 0:
		if body.name == "player":
			pers = body
			deg = 1
			body.hit(rand_range(1.5, 2.5))
			$Timer.start(0.12)
	pass # Replace with function body.


func _on_Timer_timeout():
	if deg == 1:
		pers.hit(rand_range(5.5, 8.5))
		$Timer.start(0.12)
	
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name == "player":
		deg = 0
	pass # Replace with function body.


func _on_cosmicgoo_area_entered(area):
	if "projprog4" in area.name:
		if PlVar.map == 7 or PlVar.map == 8:
			get_parent().get_parent().cosmic = 0
		if PlVar.map == 20:
			get_parent().get_parent().get_parent().cosmic = 0
	pass # Replace with function body.


func _on_cosmicgoo_area_exited(area):
	if "projprog4" in area.name:
		if PlVar.map == 7 or PlVar.map == 8:
			get_parent().get_parent().cosmic = 1
		if PlVar.map == 20:
			get_parent().get_parent().get_parent().cosmic = 1
	pass # Replace with function body.
