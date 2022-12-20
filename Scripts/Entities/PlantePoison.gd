extends AnimatedSprite
var sym
var taille
var proj = preload("res://Scenes/Entities/Poison.tscn")
var nb
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	nb = rand_range(20, 40)
	nb = int(nb)
	taille = rand_range(0.5, 1)
	self.scale = Vector2(taille, taille)
	sym = rand_range(-1, 1)
	sym = int(sym)
	self.modulate = Color(rand_range(0.000000, 1.000000), rand_range(0.000000, 1.000000), 1, 1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if sym == 0:
		var sym = rand_range(-1, 1)
		sym = int(sym)
	else:
		self.scale.x = sym * self.scale.x
	pass


func _on_vision_body_entered(body):
	if self.animation == "default":
		if body.name == "player":
			self.set_animation("launch")
	pass # Replace with function body.


func _on_PlantePoison_animation_finished():
	if self.animation == "launch":
		self.set_animation("end")
		while nb > 0:
			var b = proj.instance()
			b.position = $Position2D.position
			add_child(b)
			nb -= 1
	pass # Replace with function body.
