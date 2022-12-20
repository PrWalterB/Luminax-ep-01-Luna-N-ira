extends CanvasLayer
var ecoul = 0
var scin = 1
var sel = 0
var stats = {"veget":[100, 100], "progfer":[75, 200], "doubliks":[100, 70], "tog":[150, 80]}
var unblock = {"veget":0, "progfer":0, "doubliks":0, "tog":0}
var backload = PlVar.get_gui_lang()
var attitre
var attdesc
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	attitre = backload[60].rsplit(";")
	attdesc = (backload[61].replace("\\n","\n")).rsplit(";")
	unblock["veget"] = int(PlVar.deblock[0])
	unblock["progfer"] = int(PlVar.deblock[1])
	unblock["tog"] = int(PlVar.deblock[3])
	unblock["doubliks"] = (float(PlVar.deblock[2])/2) + (float(PlVar.deblock[4])/2)
	if PlVar.tuto == 2:
		PlVar.tuto = 3
	if PlVar.map == 0 or PlVar.map == 1 or PlVar.map == 2:
		sel = 3
	if PlVar.map == 4:
		sel = 2
	if PlVar.map == 5 or PlVar.map == 6:
		sel = 5
	$Timer.start(0.01)
	$Timer2.start(0.25)
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 0:
		queue_free()
	for i in $InfoPlanet/Attacks/Attaques.get_children():
		if unblock[i.name] == 1:
			i.modulate = Color(1,1,1)
			i.get_node("Perso").play("active")
			i.get_node("Stats").text = (backload[58] + ": " + str(stats[i.name][0])).replace("\n","") + "\n" + (backload[59] + ": " + str(stats[i.name][1])).replace("\n","")
			for j in i.get_children():
				if "ATT" in j.name:
					j.get_node("Name").text = attitre[int(j.name.replace("ATT",""))]
					j.get_node("Name2").text = attdesc[int(j.name.replace("ATT",""))]
		else:
			i.get_node("Stats").text = (backload[58] + ": ???").replace("\n","") + "\n" + (backload[59] + ": ???").replace("\n","")
			for j in i.get_children():
				if "ATT" in j.name:
					j.get_node("Name").text = "???"
					j.get_node("Name2").text = "???"
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
	$stars.set_rotation_degrees($stars.get_rotation_degrees()+(0.01*PlVar.uldelta))
	$Timer.start(0.0001)
	pass # Replace with function body.
