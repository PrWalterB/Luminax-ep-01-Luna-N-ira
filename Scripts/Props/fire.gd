extends AnimatedSprite
var particule = preload("res://Scenes/Other/particle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.frame = int(rand_range(0, 4))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "fire" in name:
		if body.name == "player" or "soldier" in body.name:
			 body.hit(rand_range(2, 2.5))
	pass # Replace with function body.


func _on_fire_animation_finished():
	
	pass # Replace with function body.


func _on_fire_frame_changed():
	if self.frame == 0 or self.frame == 2:
		var b = particule.instance()
		b.set_z_index(2)
		if "soufre" in name:
			b.start(17, 100)
		if "fire" in name:
			b.start(15, 3)
		add_child(b)
	pass # Replace with function body.
