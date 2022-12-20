extends Node2D
var solu = [[6,5,3,1,2,4],[4,5,1,2,6,3],[1,5,6,4,3,2],[1,4,2,6,5,3],[5,1,6,4,2,3],[3,4,6,1,2,5]]
var puzz = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
var erreur = 0
var succeed = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in self.get_children():
		if i.name[0] == "r":
			for j in i.get_children():
				var coord1 = j.name
				for y in j.get_children():
					if y.name != "socle":
						var coord2 = y.name[7]
						y.get_node("sprite").texture = load("res://Sprites/Props/Black Moon/einstein/" + coord1 + "_" + coord2 + ".png")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	for i in self.get_children():
		if i.name[0] == "r":
			var coord0 = i.name[1]
			for j in i.get_children():
				var coord1 = j.name
				for y in j.get_children():
					if y.name != "socle":
						var coord2 = y.name[7]
						if puzz[int(coord1) - 1][int(coord0) - 1] != int(coord2) and puzz[int(coord1) - 1][int(coord0) - 1] != 0:
							y.active = -1
						if int(coord0) - 1 != puzz[int(coord1) - 1].rfind(int(coord2)) and puzz[int(coord1) - 1].rfind(int(coord2)) != -1:
							y.active = -1
						if y.active == 0:
							y.get_node("sprite").texture = load("res://Sprites/Props/Black Moon/einstein/" + coord1 + "_" + coord2 + ".png")
						if y.active == 1:
							if int(coord2) != solu[int(coord1) - 1][int(coord0) - 1]:
								erreur = 1
							else:
								if puzz[int(coord1) - 1][int(coord0) - 1] != int(coord2):
									succeed += 1
								puzz[int(coord1) - 1][int(coord0) - 1] = int(coord2)
								
							y.get_node("sprite").texture = load("res://Sprites/Props/Black Moon/einstein/" + coord1 + "-" + coord2 + ".png")
						if y.active == -1:
							y.get_node("sprite").texture = load("res://Sprites/Props/Black Moon/einstein/" + coord1 + "+" + coord2 + ".png")
							if int(coord2) == solu[int(coord1) - 1][int(coord0) - 1]:
								erreur = 1
	if erreur == 1:
		for i in self.get_children():
			if i.name[0] == "r":
				for j in i.get_children():
					for y in j.get_children():
						if y.name != "socle":
							y.active = 0
		puzz = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
		succeed = 0
		erreur = 0
	pass
