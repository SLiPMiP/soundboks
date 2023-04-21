extends Spatial



var newbox = CSGBox.new()
var listobox = []
var boxid = 0
var boxmat = SpatialMaterial.new()
var sbox={}
var objsboxs=[]

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


signal newlistitem(boxid,listobox)


func createnewbox():
	boxid +=1
	
	for i in range(listobox.size()):
		listobox[i]["high"]=false
	
 sbox = {
	"id":boxid,
	"pos":Vector3(0,0,0),
	"size":Vector3(10,10,10),
	"name":"Instrument",
	"color":Color8(90,130,170),
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
	
	add_child(newbox)
	objsboxs.append(newbox)
	
	emit_signal("newlistitem",boxid,listobox)
	

func _on_newboxbutton_pressed():
	createnewbox()
#	print(listobox[0]["pos"].x)



func _on_x_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["pos"].x=value
			objsboxs[i].set_translation(listobox[i]["pos"])


func _on_y_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["pos"].y=value
			objsboxs[i].set_translation(listobox[i]["pos"])


func _on_z_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["pos"].z=value
			objsboxs[i].set_translation(listobox[i]["pos"])
			




func _on_width_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["size"].z=value
			objsboxs[i].set_width(listobox[i]["size"].z)


func _on_height_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["size"].y=value
			objsboxs[i].set_height(listobox[i]["size"].y)


func _on_depth_value_changed(value):
	for i in range(listobox.size()):
		if listobox[i]["high"]==true:
			listobox[i]["size"].x=value
			objsboxs[i].set_depth(listobox[i]["size"].x)
