extends Node

@onready var pauseMenu = $LeftHand/pause_menu
@onready var debugMenu = $LeftHand/debug_menu
# we take the instanciated debug menu UI scene
@onready var scene_instance = debugMenu.get_scene_instance() 
@onready var FunctionPointer = $RightHand/FunctionPointer

signal hit_by_ennemy(damage)

# test values, rememmber to remove !!!
var counter = 0
var btn_presed
var incr = 0

func _process(delta: float) -> void:
	counter += 1
	print(scene_instance.get_content())
	scene_instance.update_content(['some test values', counter, btn_presed, incr])
 
func _on_area_3d_body_entered(body):
	print("Collision détectée avec :", body.name)

	if (body.name == "Creature"):
		emit_signal("hit_by_ennemy", body.damage)

# function to reload to game when the B button is pressed
# no more needed thanks to the left hand menu

func _on_right_hand_button_pressed(name):
	btn_presed = name
	if name == 'by_button':
		incr += 1
	if name == 'ax_button':
		incr -= 1

func _on_left_hand_button_pressed(name):
	btn_presed = name
	if name == "ax_button":
		debugMenu.visible = !debugMenu.visible
	if name == "menu_button":
		get_tree().paused = !get_tree().paused
		pauseMenu.visible = !pauseMenu.visible
		FunctionPointer.visible = !FunctionPointer.visible
