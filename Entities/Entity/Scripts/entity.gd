class_name Entity

extends CharacterBody3D

@export var race : String # Enum ?
@export var description : String
@export var hpMax : int
var hp : int
@export var isInvincible : bool
@export var isTrackingPlayer : bool # ?


# Basic movement
func passive_movement() -> void:
	pass # Replace with function body.

# Movement on player targeting
func targeted_movement() -> void:
	pass # Replace with function body.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = hpMax 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_on_floor() == false:
		velocity += get_gravity() * delta
		
	move_and_slide()
	
	
	
	
