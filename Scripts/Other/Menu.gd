#Bonne chance.
extends CanvasLayer
var strom = 0
var optionmenu = preload("res://Scenes/Other/Options.tscn")
var succmenu = preload("res://Scenes/Other/Succes.tscn")
var rssmenu = preload("res://Scenes/Other/rss_reader.tscn")
var credmenu = preload("res://Scenes/Other/credits.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$starsturn.start(0.001)
	$stormturn.start(rand_range(4.0, 8.0))
	PlVar.map = -1
	verify()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$LuminaxMainTheme.set_volume_db(PlVar.music)
	$Storm.set_volume_db(PlVar.music)
	pass


func _on_Play_mouse_entered():
	$Node/Playspr.play("toggle")
	pass # Replace with function body.


func _on_Play_mouse_exited():
	$Node/Playspr.play("default")
	pass # Replace with function body.


func _on_starsturn_timeout():
	$stars.set_rotation_degrees($stars.get_rotation_degrees()+0.01)
	$starsturn.start(0.0001)
	pass # Replace with function body.


func _on_stormturn_timeout():
	if strom == 2:
		strom = 0
	if strom == 1:
		$storm.play("default")
		$Node/Playspr.play("default")
		$Node/Tutospr.play("default")
		$title.play("default")
		$Node2/huit.play("default")
		$Node3/optionsspt.play("default")
		$Node4/succspt.play("default")
		$Node5/rssspt.play("default")
		$Node6/credspt.play("default")
		$stormturn.start(rand_range(4.0, 8.0))
		strom = 2
	if strom == 0:
		var type = rand_range(0,2)
		if type >= 1:
			$storm.play("storm")
		if type <= 1:
			$storm.play("storm2")
		$Storm.stream = load("res://Sons/eclair" + str(int(type)) + ".wav")
		$Storm.play()
		$Node/Playspr.play("storm")
		$Node/Tutospr.play("storm")
		$title.play("storm")
		$Node2/huit.play("storm")
		$Node3/optionsspt.play("storm")
		$Node4/succspt.play("storm")
		$Node5/rssspt.play("storm")
		$Node6/credspt.play("storm")
		$stormturn.start(0.1)
		strom = 1
	pass # Replace with function body.


func _on_868_mouse_entered():
	$Node2/huit.play("toggle")
	pass # Replace with function body.


func _on_868_mouse_exited():
	$Node2/huit.play("default")
	pass # Replace with function body.


func _on_options_mouse_entered():
	$Node3/optionsspt.play("toggle")
	pass # Replace with function body.


func _on_options_mouse_exited():
	$Node3/optionsspt.play("default")
	pass # Replace with function body.


func _on_Play_pressed():
	PlVar.load_game()
	pass # Replace with function body.


func _on_options_pressed():
	if PlVar.pause == 0:
		PlVar.pause = 1
		PlVar.clic(1)
		var b = optionmenu.instance()
		get_parent().add_child(b)
	pass # Replace with function body.


func _on_868_pressed():
	PlVar.clic(1)
	print("I HATE CLOSED SOURCE SOFTWARE I HATE CLOSED SOURCE SOFTWARE AAAAH (made with free software)")
	# warning-ignore:return_value_discarded
	OS.shell_open("https://discord.gg/QuMGB7zT47")
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$LuminaxMainTheme.play()
	pass # Replace with function body.



func _on_suCC_mouse_entered():
	$Node4/succspt.play("toggle")
	pass # Replace with function body.


func _on_suCC_mouse_exited():
	$Node4/succspt.play("default")
	pass # Replace with function body.


func _on_suCC_pressed():
	if PlVar.pause == 0:
		PlVar.pause = 1
		PlVar.clic(1)
		var b = succmenu.instance()
		get_parent().add_child(b)
	pass # Replace with function body.


func _on_RSS_pressed():
	if PlVar.pause == 0:
		PlVar.pause = 1
		PlVar.clic(1)
		var b = rssmenu.instance()
		get_parent().add_child(b)
	pass # Replace with function body.


func _on_RSS_mouse_entered():
	$Node5/rssspt.play("toggle")
	pass # Replace with function body.


func _on_RSS_mouse_exited():
	$Node5/rssspt.play("default")
	pass # Replace with function body.

func verify():
	var veri = 0
	var back = PlVar.load_rss()
	for i in back:
		if i[0] == "1":
			veri = 1
	if veri == 1:
		$Node5/ex.visible = true
	else:
		$Node5/ex.visible = false
	pass


func _on_Credit_pressed():
	if PlVar.pause == 0:
		PlVar.pause = 1
		PlVar.clic(1)
		var b = credmenu.instance()
		get_parent().add_child(b)
	pass # Replace with function body.


func _on_Credit_mouse_entered():
	$Node6/credspt.play("toggle")
	pass # Replace with function body.


func _on_Credit_mouse_exited():
	$Node6/credspt.play("default")
	pass # Replace with function body.


func _on_Tuto_pressed():
	PlVar.nextmap = 868
	PlVar.nextx = 505
	PlVar.nexty = 297
	Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	pass # Replace with function body.


func _on_Tuto_mouse_entered():
	$Node/Tutospr.play("toggle")
	pass # Replace with function body.


func _on_Tuto_mouse_exited():
	$Node/Tutospr.play("default")
	pass # Replace with function body.
