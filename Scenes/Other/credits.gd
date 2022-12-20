extends CanvasLayer
var backfin = []
var texte = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var save_lang= File.new()
	if not save_lang.file_exists("res://Languages/"+ PlVar.lang +"licence.tres"):
		print("error")
		return # Error! We don't have a save to load.
	save_lang.open("res://Languages/"+ PlVar.lang +"licence.tres", File.READ)
	while not save_lang.eof_reached():
		var current_line = save_lang.get_line()
		backfin.append(current_line + "\n")
	var r = 0
	for i in backfin:
		texte += backfin[r]
		r += 1
	var backload = PlVar.get_gui_lang()
	$Credits/Button.text = backload[2]
	$Credits/Panel/TextEdit.text = texte
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	PlVar.clic(3)
	if PlVar.map == -1:
		PlVar.pause = 0
	queue_free()
	pass # Replace with function body.
