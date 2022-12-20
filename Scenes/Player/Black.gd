extends Sprite
var trans = 0.001
var ascend = 0
var colo = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer2_timeout():
	if ascend <= 1 and ascend >= 0:
		ascend+=trans*PlVar.uldelta
		self.set_modulate(Color(colo,colo,colo, ascend))
		$Timer2.start(0.0001)
	pass # Replace with function body.

func fondu(tran, asc, col=0):
	trans = tran
	ascend= asc
	colo = col
	$Timer2.start(0.0001)
		
