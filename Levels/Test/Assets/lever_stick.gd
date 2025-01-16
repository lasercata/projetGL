extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees.z = tan(abs(position.x - get_node("GrabPoint").position.x)/abs(position.y - get_node("GrabPoint").position.y))
