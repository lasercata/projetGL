extends Node3D

func _ready() -> void:
	pass # Replace with function body
var degrees = 0

func _process(delta: float) -> void:
	rotation_degrees.z = degrees
