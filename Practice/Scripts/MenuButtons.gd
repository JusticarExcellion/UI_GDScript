extends Button

class_name ButtonFunctions

signal GreetingsSignal
signal SubVisibility

func _init():
	print("Button is OK")
	
func _pressed():
	emit_signal("GreetingsSignal")
	emit_signal("SubVisibility")

