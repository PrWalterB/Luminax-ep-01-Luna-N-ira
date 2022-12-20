extends KinematicBody2D
var lifboul = 0
var lifbouboul = 0.9
var dead = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if lifboul < 5:
		get_parent().texture = load("res://Sprites/Props/Cygio/boule_" + str(lifboul) + ".png")
	if lifboul >= 5 and dead == 0:
		dead = 1
		get_parent().get_parent().get_parent().get_parent().nbsave += 1
		get_parent().get_parent().get_parent().get_parent().seldial += 1
		get_parent().get_parent().get_parent().get_parent().currdial = get_parent().get_parent().get_parent().get_parent().dials[get_parent().get_parent().get_parent().get_parent().seldial][0]
		PlVar.action(get_parent().get_parent().get_parent().get_parent().currdial)
		if get_parent().get_parent().get_parent().get_parent().seldial == 5:
			PlVar.scenario[17] = "2"
			PlVar.save_succ(15)
		get_parent().get_parent().get_parent().get_parent().get_node("DIALOS").start(PlVar.vitphac + 0.1)
		get_parent().texture = load("res://Sprites/Props/Cygio/boule_5.png")
	pass

# warning-ignore:unused_argument
func hit(damage):
	lifbouboul += 0.2
	lifboul = int(lifbouboul)
	pass
