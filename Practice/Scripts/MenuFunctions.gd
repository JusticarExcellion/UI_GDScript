extends Control


class_name MenuFunction

@onready var ButtonChild : Control = find_child("Button", false)
const visibility : bool = false
var subVisible : bool = false
var connectedSignals : bool = false

func _init():
	pass

func _input(event):
	if Input.is_action_just_pressed("OpenCharacter"):
		
		if ButtonChild:
			print("Found Button")
			print(ButtonChild)
		else:
			print("Button Not Found")
	#This is a weird trick, it seems like the Inputs come before signals in the processing pipeline, so we connect to the signal when we see that our mouse is pressed, it's impractical but for right now it's fun
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && !connectedSignals:
		ButtonChild.connect("GreetingsSignal", childIsOK)
		ButtonChild.connect("SubVisibility", ToggleSubVis)
		connectedSignals = true

func childIsOK():
	print("Child is OK")
	ButtonChild.disconnect("GreetingsSignal", childIsOK)
	
func ToggleSubVis():
	var subtrees : Control = find_child("SubMenu")
	subVisible = !subVisible
	subtrees.visible = subVisible
	ButtonChild.disconnect("SubVisibility", ToggleSubVis)
	connectedSignals = false

