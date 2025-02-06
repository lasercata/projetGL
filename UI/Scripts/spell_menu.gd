class_name SpellMenu

extends Node3D

@onready var debugMenu = $LeftHand/debug_menu
# we take the instantiated debug menu UI scene
@onready var debugMenu_scene = debugMenu.get_scene_instance() 

var test: String = "gnééééééééééééé"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var left_hands = get_parent_node_3d().get_node("LeftHand")
	
	
	
	position = left_hands.position
	
	
	debugMenu_scene.update_content(['SpellMenu', position, test])

	pass
