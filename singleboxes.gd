extends VBoxContainer


var newHcont = HBoxContainer.new()
var newVcont = VBoxContainer.new()
var newButt = Button.new()
var newLabel = Label.new()
var newPanel = Panel.new()
var newColor= ColorPickerButton.new()



func _ready():
	pass # Replace with function body.

onready var xvalue = $"../../x"
onready var yvalue = $"../../y"
onready var zvalue = $"../../z"
func _button_pressed(boxid,listobox):
#	print("gays count to"+String(listobox[boxid-1]["id"]))
	for i in range(listobox.size()):
		listobox[i]["high"]=false
	listobox[boxid-1]["high"]=true
	xvalue.value = listobox[boxid-1]["pos"].x 
	yvalue.value = listobox[boxid-1]["pos"].y
	zvalue.value = listobox[boxid-1]["pos"].z 
	
func _color_changed(color,boxid,listobox):
	listobox[boxid-1]["color"]=color

func createnewlistitem(boxid,listobox):
	newPanel = Panel.new()
	newPanel.rect_min_size=Vector2(100,50)
	add_child(newPanel)
	
	newVcont=VBoxContainer.new()
	newVcont.rect_min_size=Vector2(100,50)
	newPanel.add_child(newVcont)

	newHcont = HBoxContainer.new()
	newHcont.rect_min_size=Vector2(100,25)
	newVcont.add_child(newHcont)
	
	newLabel=Label.new()
	newLabel.rect_min_size=Vector2(50,25)
	newLabel.text=String(boxid)
	newLabel.align=1
	newLabel.valign=1
	newHcont.add_child(newLabel)
	
	#newColor =ColorPickerButton.new()
	#newColor.rect_min_size=Vector2(50,25)
	#newColor.color=listobox[boxid-1]["color"]
	#newHcont.add_child(newColor)
	#changed ui, removed this element from the list
	
	newButt=Button.new()
	newButt.rect_min_size=Vector2(100,25)
	newButt.text=listobox[boxid-1]["name"]
	newButt.connect("pressed", self, "_button_pressed",[boxid,listobox])
	newVcont.add_child(newButt)
	
func _on_Spatial_newlistitem(boxid,listobox):
	createnewlistitem(boxid,listobox)
