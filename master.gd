extends Spatial



var newbox = CSGBox.new()
var listobox = []
var boxid = 0
var boxmat = SpatialMaterial.new()
var sbox = {}
var objsboxs = []
var textlabelthing = Label3D.new()

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


signal newlistitem(boxid,listobox)


func createnewbox():
	boxid += 1
	
	for i in range(listobox.size()):
		listobox[i]["high"] = false
	
 sbox = {
	"id":boxid,
	"pos":Vector3(0,0,0),
	"size":Vector3(10,10,10),
	"name":"Instrument",
	"color":Color(0.352941,0.509804,0.666667,1), #RGBA
	"split":false,
	"high":true
	}
		
	listobox.append(sbox)
	newbox = CSGBox.new()
	newbox.set_depth(listobox[boxid-1]["size"].x)
	newbox.set_height(listobox[boxid-1]["size"].y)
	newbox.set_width(listobox[boxid-1]["size"].z)
	newbox.set_translation(listobox[boxid-1]["pos"])
	
	boxmat = SpatialMaterial.new()
	newbox.set_material(boxmat)
	boxmat.albedo_color=listobox[boxid-1]["color"]
	
	textlabelthing = Label3D.new()
	textlabelthing.set_text(listobox[boxid-1]["name"])
	textlabelthing.set_translation(Vector3(0,0,listobox[boxid-1]["size"].z/2+0.01))
	textlabelthing.set_outline_modulate(Color(1,1,1,1))
	add_child(textlabelthing)
	
	add_child(newbox)
	objsboxs.append(newbox)
	
	emit_signal("newlistitem",boxid,listobox)


func _on_newboxbutton_pressed():
	createnewbox()
	xvalue.value = listobox[boxid-1]["pos"].x 
	yvalue.value = listobox[boxid-1]["pos"].y
	zvalue.value = listobox[boxid-1]["pos"].z 
	widthvalue.value = listobox[boxid-1]["size"].z 
	heightvalue.value = listobox[boxid-1]["size"].y
	depthvalue.value = listobox[boxid-1]["size"].x 
	
	
	

onready var xvalue = $Control/x/xn
func _on_x_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["pos"].x = value
			xvalue.value = value
			objsboxs[i].set_translation(listobox[i]["pos"])

onready var yvalue = $Control/y/yn
func _on_y_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["pos"].y = value
			yvalue.value = value
			objsboxs[i].set_translation(listobox[i]["pos"])

onready var zvalue = $Control/z/zn
func _on_z_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["pos"].z = value
			zvalue.value = value
			objsboxs[i].set_translation(listobox[i]["pos"])
			



onready var widthvalue = $Control/width/wn
func _on_width_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["size"].z = value
			widthvalue.value = value
			objsboxs[i].set_width(listobox[i]["size"].z)

onready var heightvalue = $Control/height/hn
func _on_height_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["size"].y = value
			heightvalue.value = value
			objsboxs[i].set_height(listobox[i]["size"].y)

onready var depthvalue = $Control/depth/dn
func _on_depth_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["size"].x = value
			depthvalue.value = value
			objsboxs[i].set_depth(listobox[i]["size"].x)


func _on_colorpicker_color_changed(color):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["color"]=color
			objsboxs[i].material.albedo_color=color
#color(0.352941,0.509804,0.666667,1)

func _on_TextEdit_text_changed(Text):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["name"] = Text
			objsboxs[i].set_text(listobox[i]["name"])
			print("gay")
