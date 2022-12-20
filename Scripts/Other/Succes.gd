extends CanvasLayer
var ecoul = 0
var scin = 1
var sel = 0
var backload = PlVar.get_gui_lang()
var complete = 0
var page = 0
var extreme = 0
var backsucc = []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	extreme = PlVar.succes.length() - 9
	PlVar.load_succ()
	var dialogues = File.new()
	if not dialogues.file_exists("res://Languages/"+ PlVar.lang + "succes.tres"):
		return # Error! We don't have a save to load.
	dialogues.open("res://Languages/"+ PlVar.lang + "succes.tres", File.READ)
	while not dialogues.eof_reached():
		var current_line = dialogues.get_line().rsplit("|")
		backsucc.append(current_line)

	if PlVar.tuto == 2:
		PlVar.tuto = 3
	if PlVar.map == 0 or PlVar.map == 1 or PlVar.map == 2:
		sel = 3
	if PlVar.map == 4:
		sel = 2
	if PlVar.map == 5 or PlVar.map == 6:
		sel = 5
	for i in PlVar.succes:
		complete += int(i)
	$macron2.text = str(complete) + " / " + str(PlVar.succes.length()) + " " + backload[66]
	$Timer.start(0.01)
	$Timer2.start(0.25)
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$macron.text = str((page/9)+1) + " / " + str((extreme/9)+1)
	if PlVar.pause == 0:
		queue_free()
		
	for i in $InfoPlanet/Succes.get_children():
		i.get_node("Titre").text = backsucc[int(i.name)+page][0]
		if PlVar.succes[int(i.name)+page] == "1":
			i.get_node("Desc").text = backsucc[int(i.name)+page][1]
			i.get_node("image").texture = load("res://Sprites/GUI/Succes/" + str(int(i.name)+page) + ".png")
		else:
			i.get_node("Desc").text = "???"
			i.get_node("image").texture = load("res://Sprites/GUI/Menu/unknowsucces.png")
	pass




func _on_Timer2_timeout():
	if scin <= 0.4:
		ecoul = 1
	if scin >= 1:
		ecoul = 0
	if ecoul == 0:
		scin -= 0.2
	if ecoul == 1:
		scin += 0.2
	pass # Replace with function body.




func _on_Timer_timeout():
	$stars.set_rotation_degrees($stars.get_rotation_degrees()+0.01)
	$Timer.start(0.0001)
	pass # Replace with function body.


func _on_Quitter_pressed():
	PlVar.clic(3)
	if PlVar.map == -1:
		PlVar.pause = 0
	queue_free()
	pass # Replace with function body.


func _on_gaucho_pressed():
	if page == 0:
		page = extreme
	else:
		page -= 9
	pass # Replace with function body.


func _on_droitard_pressed():
	if page == extreme:
		page = 0
	else:
		page += 9
	pass # Replace with function body.
