extends Node

@onready var Viewport2Din3D = $LeftHand/Viewport2Din3D
@onready var FunctionPointer = $RightHand/FunctionPointer

signal hit_by_ennemy(damage)

func _on_area_3d_body_entered(body):
	print("Collision détectée avec :", body.name)

	if (body.name == "Creature"):
		emit_signal("hit_by_ennemy", body.damage)


func _on_right_hand_button_pressed(name):
	#if name == "by_button":
	#	get_tree().reload_current_scene()
	pass


func _on_left_hand_button_pressed(name):
	if name == "menu_button":
		get_tree().paused = !get_tree().paused
		Viewport2Din3D.visible = !Viewport2Din3D.visible
		FunctionPointer.visible = !FunctionPointer.visible
