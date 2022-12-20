extends Node2D
var type = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.set_animation(str(type))
	if type == 0:
		$AudioStreamPlayer2D.stream = load("res://Sons/oiseauforet.wav")
		$AudioStreamPlayer2D.max_distance = 500
	if type == 1:
		$AudioStreamPlayer2D.stream = load("res://Sons/gnonmarch.wav")
		$AudioStreamPlayer2D.max_distance = 200
	$Moove.start(0.001)
	$Destroy.start(120)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer2D.set_volume_db(PlVar.son + 10)
	pass


func _on_Moove_timeout():
	if type == 0:
		self.position.y += 1.5*PlVar.uldelta
	if type == 1:
		self.position.x += 3*PlVar.uldelta
	$Moove.start(0.0001)
	pass # Replace with function body.


func _on_Destroy_timeout():
	queue_free()
	pass # Replace with function body.


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
