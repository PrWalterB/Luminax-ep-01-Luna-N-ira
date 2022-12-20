extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var backload = PlVar.get_gui_lang()
	$Titre.text = backload[72]
	$SousTitre.text = backload[73]
	$Veget/Label.text = backload[74]
	$Progfer/Label.text = backload[75]
	$Doublix/Label.text = backload[76]
	$Doobliks/Label.text = backload[77]
	$Tog/Label.text = backload[78]
	$Button.text = backload[12]
	$Veget/Label2.text = str($Veget/SliderV.value)
	$Progfer/Label2.text = "x" + str($Progfer/SliderP.value)
	$Doublix/Label2.text = str(($Doublix/SliderD.value)/3600) + "h"
	$Tog/Label2.text = str($Tog/SliderT.value)
	$Doobliks/Label2.text = "x" + str($Doobliks/SliderO.value)
	pass


func _on_Button_pressed():
	PlVar.diffveg = $Veget/SliderV.value
	PlVar.life = $Veget/SliderV.value
	PlVar.diffpro = $Progfer/SliderP.value
	PlVar.diffdou = $Doublix/SliderD.value
	PlVar.difftog = $Tog/SliderT.value
	PlVar.vies = $Tog/SliderT.value
	PlVar.diffdoo = $Doobliks/SliderO.value
	PlVar.save_game()
	if PlVar.diffdou != 0:
		PlVar.get_node("Defi").start(1)
	Omni.goto_scene("res://Scenes/Maps/MaisonVeget.tscn")
	pass # Replace with function body.
