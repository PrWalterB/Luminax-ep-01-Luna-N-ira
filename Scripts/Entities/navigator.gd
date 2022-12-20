extends Node2D
var champmush = preload("res://Scenes/Maps/nav2.tres")
var spatio = preload("res://Scenes/Maps/nav3.tres")
var oosphiros = preload("res://Scenes/Maps/nav5.tres")
var cygio = preload("res://Scenes/Maps/nav14.tres")
var tuto = preload("res://Scenes/Maps/nav868.tres")
var second = PlVar.player_pos
var path : = PoolVector2Array() 
var k = 0
var baspos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	baspos = global_position
	global_position = Vector2(0,0)
	$soldier.global_position = baspos
	$Timer.start(0.2)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	second = PlVar.player_pos - global_position
	path = $navigator.get_simple_path($soldier.position, second)
	$soldier.path = path
	if PlVar.map == 5:
		if PlVar.scenario[9] == "1":
			$soldier.mort = true
			$soldier/Timer.start(0.001)
	pass

func _on_Timer_timeout():
	if k == 0:
		if PlVar.map == 1:
			$navigator/NavigationPolygonInstance.navpoly = champmush
		if PlVar.map == 2:
			$navigator/NavigationPolygonInstance.navpoly = spatio
		if PlVar.map == 5:
			if PlVar.scenario[9] == "1":
				queue_free()
			$navigator/NavigationPolygonInstance.navpoly = oosphiros
			global_position = Vector2(1344.53,1609.57)
			$soldier.global_position = baspos
		if PlVar.map == 14:
			$navigator/NavigationPolygonInstance.navpoly = cygio
		if PlVar.map == 868:
			$navigator/NavigationPolygonInstance.navpoly = tuto
		k = 1
	pass # Replace with function body.
