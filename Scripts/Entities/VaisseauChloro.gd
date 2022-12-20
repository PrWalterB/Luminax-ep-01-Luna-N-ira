extends Node2D
var move = 0
var pales = [[0.5, 7, 1],[0.2, 11, 1],[0.2, 3, 1],[0.1, 5, 1],[0.1, 1, 1],[0.05, 2, 1]]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(0.001)
	$PALES.start(0.005)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	self.global_position.x -= move*PlVar.uldelta
	$Timer.start(0.001)
	pass # Replace with function body.


func _on_PALES_timeout():
	for i in self.get_children():
			if "pale" in i.name:
				var splinter = int(i.name.rsplit("_")[1])
				if i.rotation_degrees > pales[splinter][1]:
					pales[splinter][2] = -1
				if i.rotation_degrees < -pales[splinter][1]:
					pales[splinter][2] = 1
				i.rotation_degrees += pales[splinter][0] * pales[splinter][2]
	$PALES.start(0.005)
	pass # Replace with function body.
