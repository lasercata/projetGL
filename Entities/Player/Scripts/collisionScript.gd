extends Node

@onready var pauseMenu = $LeftHand/pause_menu
@onready var debugMenu = $LeftHand/debug_menu
@onready var FunctionPointer = $RightHand/FunctionPointer

signal hit_by_ennemy(damage)

func _on_area_3d_body_entered(body):
	print("Collision détectée avec :", body.name)

	if (body.name == "Creature"):
		emit_signal("hit_by_ennemy", body.damage)

# function to reload to game when the B button is pressed
# no more needed thanks to the left hand menu
#func _on_right_hand_button_pressed(name):
	#if name == "by_button":
		#get_tree().reload_current_scene()

func _on_left_hand_button_pressed(name):
	if name == "menu_button":
		get_tree().paused = !get_tree().paused
		pauseMenu.visible = !pauseMenu.visible
		debugMenu.visible = !debugMenu.visible
		#debugMenu.get_child(0).update_content([1, 2, 3, 4, 5])
		FunctionPointer.visible = !FunctionPointer.visible
