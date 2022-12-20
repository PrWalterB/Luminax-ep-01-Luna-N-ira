extends Node2D
var perso = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	perso = PlVar.perso
	if PlVar.map == -1 or PlVar.map == -2:
		$AnimatedSprite.play("menu")
	else:
		if perso == 0:
			$AnimatedSprite.play("veg")
		elif perso == 1:
			$AnimatedSprite.play("prog")
		elif perso == 2:
			$AnimatedSprite.play("doub")
		elif perso == 3:
			$AnimatedSprite.play("tog")
		else:
			$AnimatedSprite.play("menu")
	self.global_position = get_global_mouse_position()
