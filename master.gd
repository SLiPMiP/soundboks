extends Spatial



var newbox = CSGBox.new()
var listobox = []
var boxid = 0
var boxmat = SpatialMaterial.new()
var sbox = {}
var objsboxs = []
var label = Label3D.new()
var lablist = []

	
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
	
	label = Label3D.new()
	label.set_text(listobox[boxid-1]["name"])
	label.translate(Vector3(0,0,listobox[boxid-1]["size"].z/2+0.01))
	label.set_translation(listobox[boxid-1]["pos"])
	label.set_outline_modulate(Color(1,1,1,1))
	label.pixel_size=0.1
	label.autowrap=true
	label.width=listobox[boxid-1]["size"].x/label.pixel_size

	add_child(label)
	lablist.append(label)
	

	add_child(newbox)
	objsboxs.append(newbox)
	
	emit_signal("newlistitem",boxid,listobox)


func _on_newboxbutton_pressed():
	createnewbox()
	xvalue.value = listobox[-1]["pos"].x 
	yvalue.value = listobox[-1]["pos"].y
	zvalue.value = listobox[-1]["pos"].z 
	widthvalue.value = listobox[-1]["size"].z 
	heightvalue.value = listobox[-1]["size"].y
	depthvalue.value = listobox[-1]["size"].x 
	$Control/x.value=0
	$Control/y.value=0
	$Control/z.value=0
	$Control/width.value=10
	$Control/height.value=10
	$Control/depth.value=10
	$Control/colorpicker.color=listobox[-1]["color"]

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
			listobox[i]["size"].x = value
			widthvalue.value = value
			objsboxs[i].set_width(listobox[i]["size"].x)
			lablist[i].width=listobox[i]["size"].x/label.pixel_size
			print(lablist[i].width)

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
			listobox[i]["size"].z = value
			depthvalue.value = value
			objsboxs[i].set_depth(listobox[i]["size"].z)


func _on_colorpicker_color_changed(color):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["color"]=color
			objsboxs[i].material.albedo_color=color
#color(0.352941,0.509804,0.666667,1)


func _on_TextEdit_textchange(text):
	for i in range(listobox.size()):
		if listobox[i]["high"] == true:
			listobox[i]["name"]=text
			lablist[i].set_text(text)
			
