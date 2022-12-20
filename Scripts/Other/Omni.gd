extends Node

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
func goto_scene(path):
	print("Hey Brumen ! 8")
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	print("Hey Brumen ! 9")
	current_scene.free()
	print("Hey Brumen ! 10")
	var s = ResourceLoader.load(path)
	print("Hey Brumen ! 11")
	current_scene = s.instance()
	print("Hey Brumen ! 12")
	get_tree().get_root().add_child(current_scene)
	print("Hey Brumen ! 13")
	get_tree().set_current_scene(current_scene)
	print("Hey Brumen ! 14")
