extends CanvasLayer
var ecoul = 0
var scin = 1
var sel = 0
var planet = "Planet"
var getname = "Planet"
var backload = PlVar.get_gui_lang()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if PlVar.tuto == 1:
		PlVar.tuto = 2
	if PlVar.map == 0 or PlVar.map == 1 or PlVar.map == 2:
		sel = 3
	if PlVar.map == 4:
		sel = 2
	if PlVar.map == 5 or PlVar.map == 6:
		sel = 5
	$planets/VulavPath.set_visible(true)
	$planets/StalorPath.set_visible(true)
	$planets/ChlorozolPath.set_visible(true)
	$planets/HydroplanPath.set_visible(true)
	$planets/GentilisPath.set_visible(true)
	$planets/CygioPath.set_visible(true)
	$planets/MagnaPath.set_visible(true)
	$planets/RauthurPath.set_visible(true)
	$planets/BMPath.set_visible(true)
	$planets/VulavPath/PathFollow2D/Vulavspr.set_rotation_degrees(randf())
	$planets/VulavPath/PathFollow2D.set_unit_offset(randf())
	$planets/StalorPath/PathFollow2D/Stalorspr.set_rotation_degrees(randf())
	$planets/StalorPath/PathFollow2D.set_unit_offset(randf())
	$planets/ChlorozolPath/PathFollow2D/Chlorozolspr.set_rotation_degrees(randf())
	$planets/ChlorozolPath/PathFollow2D.set_unit_offset(randf())
	$planets/GentilisPath/PathFollow2D/Gentilisspr.set_rotation_degrees(randf())
	$planets/GentilisPath/PathFollow2D.set_unit_offset(randf())
	$planets/HydroplanPath/PathFollow2D/spr.set_rotation_degrees(randf())
	$planets/HydroplanPath/PathFollow2D.set_unit_offset(randf())
	$planets/Belt.set_rotation_degrees(randf())
	$planets/CygioPath/PathFollow2D/spr.set_rotation_degrees(randf())
	$planets/CygioPath/PathFollow2D.set_unit_offset(randf())
	$planets/MagnaPath/PathFollow2D/spr.set_rotation_degrees(randf())
	$planets/MagnaPath/PathFollow2D.set_unit_offset(randf())
	$planets/RauthurPath/PathFollow2D/spr.set_rotation_degrees(randf())
	$planets/RauthurPath/PathFollow2D.set_unit_offset(randf())
	$planets/BMPath/PathFollow2D/spr.set_rotation_degrees(randf())
	$planets/BMPath/PathFollow2D.set_unit_offset(randf())
	$Timer.start(0.01)
	$Timer2.start(0.25)
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 0:
		queue_free()
	if PlVar.map == 0 or PlVar.map == 1 or PlVar.map == 2 or PlVar.map == 12:
		$where.set_global_position($planets/ChlorozolPath/PathFollow2D/Chlorozolspr.global_position)
	if PlVar.map == 4:
		$where.set_global_position($planets/StalorPath/PathFollow2D/Stalorspr.global_position)
	if PlVar.map == 5 or PlVar.map == 6 or PlVar.map == 7 or PlVar.map == 8 or PlVar.map == 9:
		$where.set_global_position($planets/HydroplanPath/PathFollow2D/spr.global_position)
	if PlVar.map == 10 or PlVar.map == 11:
		$where.set_global_position($planets/VulavPath/PathFollow2D/spr.global_position)
	if PlVar.map == 14:
		$where.set_global_position($planets/CygioPath/PathFollow2D/spr.global_position)
	if PlVar.map >= 15:
		$where.set_global_position($planets/BMPath/PathFollow2D/spr.global_position)
	if PlVar.map == 0 or PlVar.map == 1 or PlVar.map == 2:
			$Panel/City.text = backload[33]
			$Panel/Desc.text = backload[34]
	if PlVar.map == 4:
			$Panel/City.text = backload[35]
			$Panel/Desc.text = backload[36]
	if PlVar.map == 5:
			$Panel/City.text = backload[43]
			$Panel/Desc.text = backload[44]
	if PlVar.map == 6 or PlVar.map == 7 or PlVar.map == 8 or PlVar.map == 9:
			$Panel/City.text = backload[49]
			$Panel/Desc.text = backload[50]
	if PlVar.map == 10 or PlVar.map == 11:
			$Panel/City.text = backload[52]
			$Panel/Desc.text = backload[53]
	if PlVar.map == 12:
			$Panel/City.text = backload[54]
			$Panel/Desc.text = backload[55]
	if PlVar.map == 13 or PlVar.map >= 15:
			$Panel/City.text = backload[79]
			$Panel/Desc.text = backload[79]
	if PlVar.map == 14:
			$Panel/City.text = backload[56]
			$Panel/Desc.text = backload[57]
	
	getname = get_node("InfoPlanet/"+planet).get_name()
	if sel == 0:
		planet = "Luminax"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[20]
		$point.set_global_position($Luminax.global_position)
	if sel == 1:
		planet = "Vulav"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[21]
		$point.set_global_position($planets/VulavPath/PathFollow2D/Vulavspr.global_position)
	if sel == 2:
		planet = "Stalor"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[22]
		$point.set_global_position($planets/StalorPath/PathFollow2D/Stalorspr.global_position)
	if sel == 3:
		planet = "Chlorozol"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[23]
		$point.set_global_position($planets/ChlorozolPath/PathFollow2D/Chlorozolspr.global_position)
	if sel == 4:
		planet = "Gentilis"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[26]
		$point.set_global_position($planets/GentilisPath/PathFollow2D/Gentilisspr.global_position)
	if sel == 5:
		planet = "Hydroplan"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[24]
		$point.set_global_position($planets/HydroplanPath/PathFollow2D/spr.global_position)
	if sel == 6:
		planet = "Cygio"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[25]
		$point.set_global_position($planets/CygioPath/PathFollow2D/spr.global_position)
	if sel == 7:
		planet = "Magna"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[27]
		$point.set_global_position($planets/MagnaPath/PathFollow2D/spr.global_position)
	if sel == 8:
		planet = "Rauthur"
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[28]
		$point.set_global_position($planets/RauthurPath/PathFollow2D/spr.global_position)
	if sel == 9:
		planet = backload[30]
		get_node("InfoPlanet/"+getname+"/Desc").text =  backload[29]
		$point.set_global_position($planets/BMPath/PathFollow2D/spr.global_position)
	$Panel/youare.text = backload[32]
	get_node("InfoPlanet/"+getname).set_name(planet)
	pass


func _on_Timer_timeout():
	$planets/VulavPath/PathFollow2D/Vulavspr.rotation += 0.005*PlVar.uldelta
	$planets/VulavPath/PathFollow2D.offset += 0.1*PlVar.uldelta
	$planets/StalorPath/PathFollow2D/Stalorspr.rotation += 0.008*PlVar.uldelta
	$planets/StalorPath/PathFollow2D.offset += 0.8*PlVar.uldelta
	$planets/ChlorozolPath/PathFollow2D/Chlorozolspr.rotation += 0.007*PlVar.uldelta
	$planets/ChlorozolPath/PathFollow2D.offset += 0.1*PlVar.uldelta
	$planets/GentilisPath/PathFollow2D/Gentilisspr.rotation += 0.01*PlVar.uldelta
	$planets/GentilisPath/PathFollow2D.offset += 1*PlVar.uldelta
	$planets/HydroplanPath/PathFollow2D/spr.rotation -= 0.007*PlVar.uldelta
	$planets/HydroplanPath/PathFollow2D.offset += 0.1*PlVar.uldelta
	$planets/Belt.rotation += 0.0001*PlVar.uldelta
	$planets/CygioPath/PathFollow2D/spr.rotation += 0.002*PlVar.uldelta
	$planets/CygioPath/PathFollow2D.offset += 0.05*PlVar.uldelta
	$planets/MagnaPath/PathFollow2D/spr.rotation -= 0.2*PlVar.uldelta
	$planets/MagnaPath/PathFollow2D.offset += 0.008*PlVar.uldelta
	$planets/RauthurPath/PathFollow2D/spr.rotation += 0.001*PlVar.uldelta
	$planets/RauthurPath/PathFollow2D.offset += 0.5*PlVar.uldelta
	$planets/BMPath/PathFollow2D/spr.rotation += 0.5*PlVar.uldelta
	$planets/BMPath/PathFollow2D.offset += 0.5*PlVar.uldelta
	$point.rotation += 0.04*PlVar.uldelta
	pass # Replace with function body.


func _on_Timer2_timeout():
	if scin <= 0.4:
		ecoul = 1
	if scin >= 1:
		ecoul = 0
	if ecoul == 0:
		scin -= 0.2*PlVar.uldelta
		$Luminax.set_modulate(Color(1, 1, 1, scin))
	if ecoul == 1:
		scin += 0.2*PlVar.uldelta
		$Luminax.set_modulate(Color(1, 1, 1, scin))
	pass # Replace with function body.


func _on_stalor_mouse_entered():
	sel = 2
	pass # Replace with function body.


func _on_vulav_mouse_entered():
	sel = 1
	pass # Replace with function body.


func _on_chloro_mouse_entered():
	sel = 3
	pass # Replace with function body.


func _on_genti_mouse_entered():
	sel = 4
	pass # Replace with function body.


func _on_hydro_mouse_entered():
	sel = 5
	pass # Replace with function body.


func _on_luminax_mouse_entered():
	sel = 0
	pass # Replace with function body.


func _on_magna_mouse_entered():
	sel = 7
	pass # Replace with function body.


func _on_cygio_mouse_entered():
	sel  = 6
	pass # Replace with function body.


func _on_rau_mouse_entered():
	sel = 8
	pass # Replace with function body.


func _on_bm_mouse_entered():
	sel = 9
	pass # Replace with function body.
