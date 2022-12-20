extends Area2D
var actd = 0
var mode = "0"
var dialogb = preload("res://Scenes/Other/DialogueBox.tscn")
var terre = 0
var mairie = 0
var choice = 0
var nbphase = "0"
# Called when the node enters the scene tree for the first time.
func _ready():
	mode = name[0]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if PlVar.pause == 0 and PlVar.phaction == 0:
		if PlVar.allow == 0:
			if PlVar.dialo == 0:
				if actd == 1:
					if mode == "1":
						if "soldial" in name:
							if PlVar.scenario[2] == "0":
								var b = dialogb.instance()
								get_parent().add_child(b)
								PlVar.dialo = 1
								PlVar.phase = 59
								$CollisionShape2D.set_disabled(true)
						if "coussindial" in name:
							if PlVar.scenario[5] == "0":
								var b = dialogb.instance()
								get_parent().add_child(b)
								PlVar.dialo = 1
								PlVar.phase = 136
								PlVar.scenario[5] = "1"
								$CollisionShape2D.set_disabled(true)
						if "meetogdial" in name:
							if PlVar.scenario[7] == "0":
								PlVar.phase = 172
								PlVar.dialo = 1
								PlVar.scenario[7] = "1"
						if "choicetogdial" in name:
							if PlVar.scenario[7] == "1":
								var b = dialogb.instance()
								get_parent().add_child(b)
								PlVar.phase = 236
								PlVar.dialo = 1
						if "sortirdial" in name:
							if PlVar.scenario[0] == "0":
								var b = dialogb.instance()
								get_parent().add_child(b)
								PlVar.phase = 242
								PlVar.dialo = 1
						if "Anddrdial" in name:
							if PlVar.scenario[10] == "0":
								PlVar.dialo = 1
								PlVar.perso = 0
								PlVar.cara = 0
								PlVar.sens = 1
								if PlVar.scenario[8] == "1":
									PlVar.phase = 283
								if PlVar.scenario[8] == "2":
									PlVar.phase = 245
						if "Boss1dial" in name:
								PlVar.dialo = 1
								PlVar.perso = 0
								PlVar.cara = 0
								PlVar.sens = 1
								if PlVar.scenario[8] == "1":
									PlVar.phase = 395
								if PlVar.scenario[8] == "2":
									PlVar.phase = 381
						if "Boss2dial" in name:
							if PlVar.scenario[14] == "0":
									PlVar.dialo = 1
									PlVar.perso = 0
									PlVar.cara = 0
									PlVar.scenario[14] = "1"
									PlVar.phase = 737
									queue_free()
						if "Boss4dial" in name:
								PlVar.dialo = 1
								PlVar.perso = 0
								PlVar.cara = 0
								PlVar.phase = 1052
								var b = dialogb.instance()
								get_parent().add_child(b)
						if "luniens" in name:
								PlVar.dialo = 1
								PlVar.perso = 0
								PlVar.cara = 0
								PlVar.phase = 922
								queue_free()
						if "Didac" in name:
							var b = dialogb.instance()
							get_parent().add_child(b)
							PlVar.phase = 1460
							PlVar.dialo = 1
								
					if Input.is_action_pressed("ui_select"):
						if mode == "2":
							if "departdial" in name or "shipbunkdial" in name:
								PlVar.mort = 2
								PlVar.phase = -1
								if PlVar.scenario[3] == "0":
									PlVar.scenario[3] = "1"
							if "shiprogdial" in name:
								if PlVar.scenario[5] == "1":
									PlVar.mort = 2
									PlVar.phase = -1
								if PlVar.scenario[5] == "0":
									var b = dialogb.instance()
									get_parent().add_child(b)
									PlVar.dialo = 1
									PlVar.phase = 112
							if "departbunkerdial" in name:
								if PlVar.scenario[9] == "1":
									PlVar.mort = 2
									PlVar.phase = -1000
									print("Hey Brumen ! 0")
								if PlVar.scenario[9] == "0":
									pass
							if "shipdejeandial" in name:
								if PlVar.scenario[14] != "0":
									if PlVar.scenario[14] == "1":
										PlVar.save_succ(6)
									PlVar.mort = 2
									PlVar.phase = -1
								if PlVar.scenario[14] == "0":
									var b = dialogb.instance()
									get_parent().add_child(b)
									PlVar.dialo = 1
									PlVar.phase = 817
							
						if mode == "3" or mode == "0":
							var b = dialogb.instance()
							get_parent().add_child(b)
							PlVar.dialo = 1
							if mode == "0":
								nbphase = name[1] + name[2] + name[3] + name[4] + name[5] + name[6]
								PlVar.phase = int(nbphase)
							if mode  == "3":
								if "progferdial" in name:
									if PlVar.scenario[0] == "1":
										PlVar.phase = 25
									if PlVar.scenario[0] == "0":
										PlVar.phase = 11
										PlVar.tuto = 0
										PlVar.scenario[0] = "1"
										PlVar.chargement = 1
										$Timer.start(1)
										PlVar.save_game()
								if "rastadial" in name:
									if PlVar.scenario[1] == "1":
										PlVar.phase = 56
									if PlVar.scenario[1] == "0":
										PlVar.phase = 42
										PlVar.scenario[1] = "1"
								if "dirtdial" in name:
									if terre >= 10:
										PlVar.phase = 68
									if terre < 10:
										PlVar.phase = 66
										terre += 1
								if "mairdial" in name:
									if mairie >= 10:
										PlVar.phase = 1366
									if mairie >= 11:
										PlVar.phase = 1368
									if mairie >= 12:
										PlVar.phase = 1370
									if mairie >= 13:
										PlVar.phase = 1372
									if mairie < 10:
										PlVar.phase = 40
									mairie += 1
								if "platesdial" in name:
									if choice == 0:
										PlVar.phase = 93
									if choice == 1 or choice == 2:
										PlVar.phase = 95
									if choice >= 3:
										PlVar.phase = 97
									choice +=1
								if "secretdial" in name:
									if get_parent().get_parent().get_parent().sct == 4:
										PlVar.phase = 1447
									else:
										PlVar.phase = 379
	pass





func _on_dialogpiq_body_exited(body):
	if body.name == "player":
		actd = 0
	pass # Replace with function body.


func _on_dialogpiq_body_entered(body):
	if body.name == "player":
		actd = 1
	pass # Replace with function body.


func _on_Timer_timeout():
	PlVar.chargement = 0
	print("Hadoclat REVIENS JE TE VOIS DANS LE TERMINAL TU ES LE SEUL A FAIRE CA .")
	pass # Replace with function body.
