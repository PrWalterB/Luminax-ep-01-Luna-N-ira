extends AnimatedSprite
var supguide = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.animation = self.name
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if supguide == 1:
		if PlVar.guide == 0:
			self.visible = false
		if PlVar.guide == 1:
			self.visible = true
	if supguide == 0:
		self.visible = false
	pass
