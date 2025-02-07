class_name Creature

extends Entity

@export var damage : int = 10 ## Amount of damage it deals when attacking
@export var attackSpeed : float ## Number of seconds between two attacks
@export var aggroRange : float ## Radius of the detection zone
@export var attackRange : float ## Range of its attacks
var drop : Array[Object] ## Array containing the items dropped once dead

# Say if the player took mob's aggro
func isMobAggro() -> bool:
	pass
	return false
	
func attack() -> void:
	pass
