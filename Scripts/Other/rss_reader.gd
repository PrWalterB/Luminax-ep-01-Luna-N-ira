extends Control
var title = []
var desc = []
var link = []
var formdesc = []
var backrss = []
var nbitem = -1
var sel = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	populateEdit()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func populateEdit():
	var backload = PlVar.get_gui_lang()
	$Label.text = backload[81]
	$OpenButton.text = backload[2]
	backrss= PlVar.load_rss()
	for i in backrss:
#		print("TITLE: "+i)
		var titre = ""
		if i[0] == "1":
			titre = "NOUVEAU: " + i[1]
		else:
			titre = i[1]
		$ItemList.add_item(titre,null,true)
	while nbitem >= 0:
		$ItemList.remove_item(nbitem)
		nbitem -= 1
	nbitem = backrss.size() - 1
	_on_ItemList_item_selected(sel)
	$ItemList.select(sel, true)

func _on_OpenButton_pressed():
	get_parent().get_parent().get_node("Menu").verify()
	PlVar.clic(3)
	PlVar.load_cfg()
	if PlVar.map == -1:
		PlVar.pause = 0
	queue_free()
#	PlVar.get_node("HTTPRequest").request("https://luminax.868center.tech/rss.xml")
	pass # Replace with function body.


func _on_ItemList_item_selected(index):
	sel = index
	if backrss[index][0] == "1":
		backrss[index][0] = "0"
		var rss = File.new()
		if not rss.file_exists("user://user.lss"):
			return # Error! We don't have a save to load.
		rss.open("user://user.lss", File.WRITE)
		var i2 = 0
		while i2 < backrss.size():
			rss.store_line(backrss[i2][0] + "|" + backrss[i2][1] + "|" + backrss[i2][2] + "|" + backrss[i2][3].replace("\n","\\n"))
			i2 += 1
		rss.close()
		populateEdit()
	$DescriptionField.text = backrss[index][3]
	$LinkButton.text = backrss[index][2]
	var imglink = backrss[index][2].right(backrss[index][2].find_last("#"))
	imglink = imglink.replace("#", "")
	load_from_url("https://luminax.868center.tech/blogthumb/" + imglink + ".png", imglink + ".png")
	pass # Replace with function body.


func _on_LinkButton_pressed():
	OS.shell_open($LinkButton.text)
	pass # Replace with function body.

func load_from_url(p_url, p_filename):
	var cache_path: String = "res://.cache/" + p_filename;
	
	var d = Directory.new()
	if !d.dir_exists(cache_path.get_base_dir()):
		d.make_dir(cache_path.get_base_dir())
	
	var request = HTTPRequest.new();
	request.download_file = cache_path;
	
	add_child(request);
	
	request.connect("request_completed", self, "on_request_completed", [cache_path]);
	request.request(p_url);
	
	
# warning-ignore:unused_argument
func on_request_completed(result, response_code, headers, body, cache_path):
	# var tex = load(cache_path) that only loads the image data from the disk
	# set_texture(tex); This did not work because `tex` is not a texture

	var img_texture = ImageTexture.new()
	img_texture.load(cache_path)
	
	$TextureRect.set_texture(img_texture)
