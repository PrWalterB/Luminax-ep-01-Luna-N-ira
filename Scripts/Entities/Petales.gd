extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# warning-ignore:unused_argument
func _process(delta):
	if get_parent().lifsol <= 0:
		if get_parent().mode != 2:
			$Petales.play("die")
			$Pistils.play("die")
			get_parent().get_node("Socle").play("die")
			get_parent().get_node("Tige").play("die")
			get_parent().mode = 2
	pass

func hit(damage):
	if PlVar.pause == 0 and PlVar.dialo == 0 and get_parent().mode != 2:
		get_parent().lifsol -= damage
		$Petales.set_animation("dam")
		var shit = rand_range(0, 1)
		if shit < 0.5:
			$SoundHit.stream = load("res://Sons/fleurhit1.wav")
		if shit >= 0.5:
			$SoundHit.stream = load("res://Sons/fleurhit2.wav")
		$SoundHit.play()
		get_parent().get_node("HIT").start(0.12)
	pass


func _on_Petales_animation_finished():
	if $Petales.animation == "die":
		$Petales.playing = false
	pass # Replace with function body.


func _on_cosmicgoo_area_entered(area):
	if "projprog4" in area.name:
		get_parent().speed = 0
	pass # Replace with function body.


func _on_cosmicgoo_area_exited(area):
	if "projprog4" in area.name:
# warning-ignore:standalone_expression
		get_parent().speed = get_parent().speed * get_parent().taille
	pass # Replace with function body.
