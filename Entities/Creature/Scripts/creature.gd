class_name Creature

extends Entity

@export var damage : int = 10 # 10 is an example
@export var attackSpeed : float
@export var aggroRange : float
@export var attackRange : float
var drop : Array[Object] 

# Say if theplayer took mob's aggro
func isMobAggro() -> bool:
	pass
	return false
	
func attack() -> void:
	pass
