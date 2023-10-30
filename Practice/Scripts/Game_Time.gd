extends Node

class_name GameManager

@onready var confirmation_dialog = $ConfirmationDialog


var children : Array

func _init():
	pass


func _on_button_pressed():
	confirmation_dialog.visible = true
