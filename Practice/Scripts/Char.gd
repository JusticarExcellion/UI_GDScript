extends Control

var CharacterMenu : Panel
@onready var animation_player = $AnimationPlayer
var openMenu : bool = true


func _ready():
	CharacterMenu = $Panel

func MenuOpen():
		if openMenu:
			animation_player.play("Menu Enters")
		elif !CharacterMenu.visible:
			animation_player.play("Menu_Leaves")
		openMenu = !openMenu

func _on_button_pressed():
	CharacterMenu.visible = !CharacterMenu.visible
	

func _input(event):
	if Input.is_action_just_pressed("OpenCharacter"):
		CharacterMenu.visible = !CharacterMenu.visible
		MenuOpen()

func _on_menu_button_pressed():
	MenuOpen()

func _on_close_character_menu_pressed():
	CharacterMenu.visible = false
