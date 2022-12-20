extends AnimatedSprite
var chara = "00Veget"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	chara = name.left(name.length()-1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	self.set_animation(chara)
	if "Doublix" in chara or "Doubliks" in chara:
		$Doublix.set_visible(true)
		$Default.set_visible(false)
		$Stalor.set_visible(false)
		$walls/Doublix.set_disabled(false)
		$walls/Default.set_disabled(true)
		$walls/Stalor.set_disabled(true)
	elif "Progfer" in chara:
		$Doublix.set_visible(false)
		$Default.set_visible(false)
		$Stalor.set_visible(true)
		$walls/Doublix.set_disabled(true)
		$walls/Default.set_disabled(true)
		$walls/Stalor.set_disabled(false)
	else:
		$Doublix.set_visible(false)
		$Default.set_visible(true)
		$Stalor.set_visible(false)
		$walls/Doublix.set_disabled(true)
		$walls/Default.set_disabled(false)
		$walls/Stalor.set_disabled(true)
	pass
