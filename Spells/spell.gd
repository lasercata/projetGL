class_name Spell

extends Node3D

# @export var name : String (already instancied in Node3d)
@export var description : String
@export var element : String # Enum Element ?
@export var damages : int
@export var manaCost : int 
@export var reloadTime : float
@export var castTime : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
