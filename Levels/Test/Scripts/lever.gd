extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("LeverStick").set("degrees", -atan((get_node("LeverStick").position.x - get_node("GrabPoint").position.x)/(get_node("LeverStick").position.y - get_node("GrabPoint").position.y)) * 180 / PI)
