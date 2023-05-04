extends CSGBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if Input.is_key_pressed(KEY_RIGHT):
		rotation_degrees.y += 5
	if Input.is_key_pressed(KEY_LEFT):
		rotation_degrees.y -= 5
	if rotation_degrees.x >-90:	
		if Input.is_key_pressed(KEY_UP):
			rotation_degrees.x -= 5
	if rotation_degrees.x < 90:
		if Input.is_key_pressed(KEY_DOWN):
			rotation_degrees.x += 5
