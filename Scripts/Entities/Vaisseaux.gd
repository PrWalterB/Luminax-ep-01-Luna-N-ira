extends Node2D
var mode = 0
var focus = 1
var turn = 0
var intensity = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 1:
		$SHOOT.paused = true
		$TURN.paused = true
		$Timer.paused = true
	if PlVar.pause == 0:
		$SHOOT.paused = false
		$TURN.paused = false
		$Timer.paused = false
		
	if mode == 0 and PlVar.phaction == 167:
		for i in self.get_children():
			if "hsoldier" in i.name:
				i.mode = 0
	if mode == 1:
		$TURN.start(0.0001)
		turn = rand_range(-1, 1)
		$SHOOT.start(0.0001)
		
		mode = 3
	if PlVar.phaction == 174:
		self.rotation_degrees = 0
	pass


func _on_SHOOT_timeout():
	if mode == 3 and focus < 13:
		get_node("hsoldier"+str(focus)).mode = 5
		if focus != 1:
			get_node("hsoldier"+str(focus - 1)).mode = 4
		else:
			get_node("hsoldier"+str(12)).mode = 4
		focus += 1
		$SHOOT.start(rand_range(1.00, 2.00))
	if mode == 3  and focus >= 13:
		focus = 1
		intensity += 0.4
		turn = rand_range(intensity + -1,intensity + 1)
		$TURN.start(0.0001)
		$SHOOT.start(0.0001)
	pass # Replace with function body.


func _on_TURN_timeout():
	if mode == 3:
		self.rotation_degrees += turn*PlVar.uldelta
		$TURN.start(0.001)
	pass # Replace with function body.


func _on_Timer_timeout():
	if mode == 4:
		for i in self.get_children():
			if "hsoldier" in i.name:
				i.mode = 4
		mode = int(rand_range(0.9, 2.1))
	pass # Replace with function body.
