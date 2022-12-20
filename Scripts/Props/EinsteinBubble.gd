extends StaticBody2D
var actd = 0
var active = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 0 and PlVar.phaction == 0:
		if PlVar.allow == 0:
			if PlVar.dialo == 0:
				if actd == 1 and active == 0:
					if Input.is_action_pressed("ui_select"):
						active = 1
	pass


func _on_inter_body_entered(body):
	if body.name == "player":
		actd = 1
	pass # Replace with function body.


func _on_inter_body_exited(body):
	if body.name == "player":
		actd = 0
	pass # Replace with function body.

# warning-ignore:unused_argument
func hit(damage):
	if active == 0:
		active = -1
	pass