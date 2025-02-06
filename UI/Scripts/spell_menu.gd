class_name SpellMenu

extends Node3D

#@onready var debugMenu = $PlayerLeftHand/debug_menu
# we take the instantiated debug menu UI scene
#@onready var debugMenu_scene = debugMenu.get_scene_instance() 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var right_hand = get_parent_node_3d().get_node("RightHand")
	position = right_hand.position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position
	
	set_angular()
	

func set_angular():
	var player_position = get_parent_node_3d().get_node("XRCamera3D").position
	var vector_pm = Vector3(position.x - player_position.x, position.y - player_position.y, position.z - player_position.z)
	
	var x = vector_pm.x
	var y = vector_pm.y
	var z = vector_pm.z
		
	rotation.y = atan2(x, z)
	rotation.z = -atan2(y, sqrt(x^2 + z^2))


func destroy():
	queue_free()
