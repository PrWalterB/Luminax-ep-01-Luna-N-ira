extends Node
var step = 0
var tunsound = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = -3
	$Vagues.play()
	$Timer.start(0.001)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if tunsound == 0:
		$Sounds.set_volume_db(PlVar.son+25)
	if tunsound == 1:
		$Sounds.set_volume_db(PlVar.son + 15)
	$Vagues.set_volume_db(PlVar.son+10)
	$Node2D/ombre.global_position.x = $Node2D/vaisseau/PathFollow2D/ship.global_position.x
	pass


func _on_Timer_timeout():
	if $Node2D/vaisseau/PathFollow2D.unit_offset < 0.99:
		$Node2D/vaisseau/PathFollow2D.unit_offset += 0.001*PlVar.uldelta
		$Timer.start(0.001)
	else:
		if step == 0:
			$Timer2.start(1)
			step = 1
	pass # Replace with function body.


func _on_Timer2_timeout():
	if step == 2:
		if tunsound == 0:
			$Sounds.stream = load("res://Sons/Descend_Tunnmar.wav")
			$Sounds.play()
			tunsound = 1
		$Node2D/plate/PathFollow2D/plate2.global_position.y += 0.3*PlVar.uldelta
		$Node2D/vaisseau/PathFollow2D/ship.global_position.y += 0.3*PlVar.uldelta
		$Node2D/ombre.global_position.y += 0.3*PlVar.uldelta
		$Timer2.start(0.001)
	if step == 1:
		$Sounds.stream = load("res://Sons/Activ_Tunnmar.wav")
		$Sounds.play()
		$Node2D/plate/PathFollow2D/plate2.play("active")
		$Timer2.start(1)
		$Timer3.start(10)
		step = 2
	pass # Replace with function body.


func _on_Timer3_timeout():
	PlVar.nextx = 1360.61
	PlVar.nexty = 1527.466
	PlVar.sens = 0
	PlVar.nextmap = 5
	Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	PlVar.phase = 0
	PlVar.perso = 0
	PlVar.cara = 0
	pass # Replace with function body.


func _on_Sounds_finished():
	if tunsound == 1:
		$Sounds.play()
	pass # Replace with function body.
