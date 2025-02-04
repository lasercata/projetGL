class_name Spell

extends RigidBody3D

# @export var name : String (already instancied in Node3d)
@export var description : String
@export var element : String # Enum Element ?
@export var damages : int
@export var manaCost : int 
@export var reloadTime : float
@export var castTime : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass    
		

func whichSpell(name):
	if name == "fireball":
		return "res://Spells/Fireball/Scenes/bole.tscn"
	else : 
		return "res://Spells/Fireball/Scenes/bole.tscn" #Temporary code while there is no other spell
