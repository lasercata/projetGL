class_name SpellMenu

extends Node3D

@onready var meshInstance = $MeshInstance3D

var debugMenu_scene


var zone
var area2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var debugMenu = get_parent_node_3d().get_node("LeftHand").get_node("debug_menu")
	debugMenu_scene = debugMenu.get_scene_instance() 

	var right_hand = get_parent_node_3d().get_node("RightHand")
	position = right_hand.position
	
	var areaSpellMenu = right_hand.get_node("AreaSpellMenu").get_node("MeshInstance3D")
	areaSpellMenu.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position
	
	set_angular()
	
	debugMenu_scene.update_content(['wesh', zone, area2])
	
	
	if zone == "green":
		self.mesh.material.albedo_color = Color.GREEN
	elif zone == "red":
		self.mesh.material.albedo_color = Color.RED
	elif zone == "blue":
		self.mesh.material.albedo_color = Color.BLUE
	else:
		self.mesh.material.albedo_color = Color.WHITE
	
	
	
func set_angular():
	var player_position = get_parent_node_3d().get_node("XRCamera3D").position
	var vector_pm = Vector3(position.x - player_position.x, position.y - player_position.y, position.z - player_position.z)
	
	var x = vector_pm.x
	var y = vector_pm.y
	var z = vector_pm.z
		
	rotation.y = atan2(x, z)
	rotation.z = -atan2(y, sqrt(x^2 + z^2))






func destroy():
	
	var areaSpellMenu = get_parent_node_3d().get_node("RightHand").get_node("AreaSpellMenu").get_node("MeshInstance3D")
	areaSpellMenu.visible = false
	
	queue_free()

# Bug potentiel : Si une entité autre que la main du joueur entre dans la zone, 
# elle devrait pouvoir interagir avec cette derniere.

func _on_red_area_entered(area: Area3D) -> void:
	area2 = area
	if area.name == "AreaSpellMenu":
		zone = "red"

func _on_green_area_entered(area: Area3D) -> void:
	area2 = area
	if area.name == "AreaSpellMenu":
		zone = "green"


func _on_blue_area_entered(area: Area3D) -> void:
	area2 = area
	if area.name == "AreaSpellMenu":
		zone = "blue"
