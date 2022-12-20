extends CanvasLayer
var backload = PlVar.get_gui_lang()
var tips = []
var tip = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.map = -4
	PlVar.get_node("Ambiance").stop()
	PlVar.get_node("Musique").stop()
	print("It's Hip to be square")
	var dialogues = File.new()
	if not dialogues.file_exists("res://Languages/"+ PlVar.lang + "tips.tres"):
		return # Error! We don't have a save to load.
	dialogues.open("res://Languages/"+ PlVar.lang + "tips.tres", File.READ)
	while not dialogues.eof_reached():
		var current_line = dialogues.get_line()
		tips.append(current_line.rsplit("|"))
	PlVar.phaction = 0
	PlVar.dialo = 0
	PlVar.messf = ""
	PlVar.locscen = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	$Timer.start(4)
	tips.pop_back()
	var i = 0
	while i < tips.size():
		var indext = tips[i][0]
		if indext == "1":
			if PlVar.censor == 0:
				tips.remove(i)
		if indext[0] == "2":
			if OS.get_datetime()["month"] == int(indext[1] + indext[2]) and OS.get_datetime()["day"] == int(indext[3] + indext[4]):
				tips = [[indext, tips[i][1]]]
				i = 0
		if indext[0] == "3":
			if OS.get_datetime()["hour"] == int(indext[1] + indext[2]) and OS.get_datetime()["minute"] == int(indext[3] + indext[4]):
				tips = [[indext, tips[i][1]]]
				i = 0
		i += 1
	tip = int(rand_range(0, tips.size()))
	$astuce.text = backload[45].replace("\n", "") + tips[tip][1]
	$Label.text = backload[47].replace("\n", "")
	var nm = (backload[48].replace("\n", "")).rsplit(";")
	if PlVar.nextmap == 0 or PlVar.nextmap == 1 or PlVar.nextmap == 2:
		$Nextmap.text = nm[0]
	if PlVar.nextmap == 4:
		$Nextmap.text = nm[1]
	if PlVar.nextmap == 5:
		$Nextmap.text = nm[2]
	if PlVar.nextmap == 6 or PlVar.nextmap == 7 or PlVar.nextmap == 8 or PlVar.nextmap == 9:
		$Nextmap.text = nm[3]
	if PlVar.nextmap == 10 or PlVar.nextmap == 11:
		PlVar.kelmus = 15
		PlVar.loop = 0
		$Nextmap.text = nm[4]
	if PlVar.nextmap == 12 or PlVar.nextmap == 13:
		$Nextmap.text = nm[5]
	if PlVar.nextmap == 14:
		$Nextmap.text = nm[6]
	if PlVar.nextmap == 15:
		$Nextmap.text = nm[7]
	if PlVar.nextmap == 18 or PlVar.nextmap == 19 or PlVar.nextmap == 20:
		$Nextmap.text = nm[8]
	if PlVar.nextmap == 868:
		$Nextmap.text = nm[9]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if PlVar.ding == 1:
		PlVar.get_node("CLC").start(1)
	if PlVar.diffdou != 0:
		PlVar.get_node("Defi").start(1)
	if PlVar.nextmap == 0:
		Omni.goto_scene("res://Scenes/Maps/MaisonVeget.tscn")
	if PlVar.nextmap == 1:
		Omni.goto_scene("res://Scenes/Maps/VillageChampmush.tscn")
	if PlVar.nextmap == 2:
		Omni.goto_scene("res://Scenes/Maps/Spatioport.tscn")
	if PlVar.nextmap == 4:
		Omni.goto_scene("res://Scenes/Maps/MaisonProgfer.tscn")
	if PlVar.nextmap == 5:
		Omni.goto_scene("res://Scenes/Maps/VilleOosphiros.tscn")
	if PlVar.nextmap == 6:
		Omni.goto_scene("res://Scenes/Maps/Bunker.tscn")
	if PlVar.nextmap == 7:
		Omni.goto_scene("res://Scenes/Maps/BossOne.tscn")
	if PlVar.nextmap == 9:
		Omni.goto_scene("res://Scenes/Maps/BunkerVaisseau.tscn")
	if PlVar.nextmap == 10:
		Omni.goto_scene("res://Scenes/Maps/VillageDejean.tscn")
	if PlVar.nextmap == 11:
		Omni.goto_scene("res://Scenes/Maps/MaisonsVulav.tscn")
	if PlVar.nextmap == 12:
		Omni.goto_scene("res://Scenes/Maps/ForetChlorozol.tscn")
	if PlVar.nextmap == 13:
		Omni.goto_scene("res://Scenes/Maps/InteriorMonolith.tscn")
	if PlVar.nextmap == 14:
		Omni.goto_scene("res://Scenes/Maps/ArenaI3.tscn")
	if PlVar.nextmap == 15:
		Omni.goto_scene("res://Scenes/Maps/DefiTraw.tscn")
	if PlVar.nextmap == 18 or PlVar.nextmap == 19 or PlVar.nextmap == 20:
		Omni.goto_scene("res://Scenes/Maps/Traw.tscn")
	if PlVar.nextmap == 868:
		Omni.goto_scene("res://Scenes/Maps/Didacticiel.tscn")
	pass # Replace with function body.
