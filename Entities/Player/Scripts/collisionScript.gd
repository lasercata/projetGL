extends Node3D

@onready var Viewport2Din3D = $LeftHand/Viewport2Din3D
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
		Viewport2Din3D.visible = !Viewport2Din3D.visible
		FunctionPointer.visible = !FunctionPointer.visible
	elif name == "ax_button":
		var scene = get_parent_node_3d().get_node("Spell")
		var spell = scene.whichSpell("fireball")
		var spell_scene = load("res://Spells/Fireball/Scenes/bole.tscn").instantiate()
		scene.add_child(spell_scene)

func _on_left_hand_button_released(name: String) -> void:
	if(name == "ax_button"):
		var scene = get_parent_node_3d().get_node("Spell")
		for bole in scene.get_children():
			bole.mode = 1
