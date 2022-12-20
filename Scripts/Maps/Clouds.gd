extends Node2D
var ascend = 0
# warning-ignore:unused_class_variable
var sky = 0
# warning-ignore:unused_class_variable
var pos = 0
# warning-ignore:unused_class_variable
var typvais = 0
var typnu = 0
# warning-ignore:unused_class_variable
var nu1 = preload("res://Sprites/Cinematics/Vaisseau/sprite158_0.png")
# warning-ignore:unused_class_variable
var nu2 = preload("res://Sprites/Cinematics/Vaisseau/sprite159_0.png")
# warning-ignore:unused_class_variable
var nu3 = preload("res://Sprites/Cinematics/Vaisseau/sprite160_0.png")
# warning-ignore:unused_class_variable
var nu4 = preload("res://Sprites/Cinematics/Vaisseau/sprite161_0.png")
# warning-ignore:unused_class_variable
var nu5 = preload("res://Sprites/Cinematics/Vaisseau/sprite158_1.png")
# warning-ignore:unused_class_variable
var nu6 = preload("res://Sprites/Cinematics/Vaisseau/sprite159_1.png")
# warning-ignore:unused_class_variable
var nu7 = preload("res://Sprites/Cinematics/Vaisseau/sprite160_1.png")
# warning-ignore:unused_class_variable
var nu8 = preload("res://Sprites/Cinematics/Vaisseau/sprite161_1.png")
var sky1 = preload("res://Sprites/Cinematics/Vaisseau/background9.png")
var sky2 = preload("res://Sprites/Cinematics/Vaisseau/background10.png")
var sky3 = preload("res://Sprites/Cinematics/Vaisseau/background11.png")
var ale = [nu1,nu2,nu3,nu4]
var aleB = [nu5,nu6,nu7,nu8]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlVar.load_cfg()
	PlVar.map = -3
	$Ambiance.set_volume_db(PlVar.son+10)
	$Ambiance.play()
	$Timer.start(0.001)
	$Timer2.start(5)
	if PlVar.phase == -3:
		ascend = 0
		typnu = 0
		$Ciel.set_texture(sky1)
		$AnimatedSprite.play("ascend0")
		$AnimatedSprite.global_position.y = 507
	if PlVar.phase == -13:
		ascend = 0
		typnu = 0
		$Ciel.set_texture(sky2)
		$AnimatedSprite.play("ascend0")
		$AnimatedSprite.global_position.y = 507
	if PlVar.phase == -23:
		ascend = 0
		typnu = 0
		$Ciel.set_texture(sky1)
		$AnimatedSprite.play("ascend1")
		$AnimatedSprite.global_position.y = 341
	if PlVar.phase == -33:
		ascend = 0
		typnu = 1
		$Ciel.set_texture(sky3)
		$AnimatedSprite.play("ascend1")
		$AnimatedSprite.global_position.y = 341
	if PlVar.phase == -4:
		ascend = 1
		typnu = 0
		$Ciel.set_texture(sky2)
		$AnimatedSprite.play("descend0")
		$AnimatedSprite.global_position.y = 110
	if PlVar.phase == -14:
		ascend = 1
		typnu = 0
		$Ciel.set_texture(sky1)
		$AnimatedSprite.play("descend0")
		$AnimatedSprite.global_position.y = 110
	if PlVar.phase == -24:
		ascend = 1
		typnu = 1
		$Ciel.set_texture(sky3)
		$AnimatedSprite.play("ascend1")
		$AnimatedSprite.global_position.y = 341
	if PlVar.phase == -34:
		ascend = 1
		typnu = 0
		$Ciel.set_texture(sky1)
		$AnimatedSprite.play("ascend1")
		$AnimatedSprite.global_position.y = 341
	if typnu == 0:
		$Nuages.set_texture(ale[rand_range(0, 3)])
		$Nuages2.set_texture(ale[rand_range(0, 3)])
	if typnu == 1:
		$Nuages.set_texture(aleB[int(rand_range(0, 3))])
		$Nuages2.set_texture(aleB[int(rand_range(0, 3))])
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

# warning-ignore:unused_argument
func _process(delta):
	if ascend == 0:
		if $Nuages.position.y >= 1000:
			$Nuages.position.y = -420
			if typnu == 0:
				$Nuages.set_texture(ale[rand_range(0, 3)])
			if typnu == 1:
				$Nuages.set_texture(aleB[int(rand_range(0, 3))])
		if $Nuages2.position.y >= 1000:
			$Nuages2.position.y = -420
			if typnu == 0:
				$Nuages2.set_texture(ale[rand_range(0, 3)])
			if typnu == 1:
				$Nuages2.set_texture(aleB[int(rand_range(0, 3))])
	if ascend == 1:
		if $Nuages.position.y <= -420:
			$Nuages.position.y = 1000
			if typnu == 0:
				$Nuages.set_texture(ale[rand_range(0, 3)])
			if typnu == 1:
				$Nuages.set_texture(aleB[int(rand_range(0, 3))])
		if $Nuages2.position.y <= -420:
			$Nuages2.position.y = 1000
			if typnu == 0:
				$Nuages2.set_texture(ale[rand_range(0, 3)])
			if typnu == 1:
				$Nuages2.set_texture(aleB[int(rand_range(0, 3))])
	pass


func _on_Timer_timeout():
	if ascend == 0:
		$Nuages.position.y += 40*PlVar.uldelta
		$Nuages2.position.y += 40*PlVar.uldelta
		$Timer.start(0.001)
	if ascend == 1:
		$Nuages.position.y -= 40*PlVar.uldelta
		$Nuages2.position.y -= 40*PlVar.uldelta
		$Timer.start(0.001)
	pass # Replace with function body.


func _on_Timer2_timeout():
	if PlVar.phase == -3 or PlVar.phase == -13 or PlVar.phase == -23 or PlVar.phase == -33:
		Omni.goto_scene("res://Scenes/Maps/Space1.tscn")
	if PlVar.phase == -4 or  PlVar.phase == -24 or  PlVar.phase == -34:
		if PlVar.phase == -4:
			PlVar.nextx = -71
			PlVar.nexty = -178
			PlVar.nextmap = 4
		if PlVar.phase == -24:
			PlVar.nextx = 36
			PlVar.nexty = 416
			PlVar.nextmap = 10
		if PlVar.phase == -34:
			PlVar.nextx = 3819
			PlVar.nexty = 5422
			PlVar.nextmap = 12
		PlVar.phase = 0
		PlVar.perso = 0
		PlVar.cara = 0
		PlVar.sens = 0
		Omni.goto_scene("res://Scenes/Other/EcranTransition.tscn")
	
	if PlVar.phase == -14:
		Omni.goto_scene("res://Scenes/Cinematics/AnimLandOosphiros.tscn")
	pass # Replace with function body.


func _on_Ambiance_finished():
	$Ambiance.play()
	pass # Replace with function body.
