class_name Entity

extends CharacterBody3D

enum passiveMode {STILL, CAMP, FOLLOWING_PATH}
enum aggressiveMode {STILL, FEELING, DISTANCE, CAC, DISTCAC}
enum targetingMode {NEAR, INTERACTION, ATTACK}


@export var race : String # Enum ?
@export var description : String
@export var hpMax : int
var hp : int
@export var isInvincible : bool
@export var isTrackingPlayer : bool # ?


@export var speed : int
@onready var navigation_agent_3d = $NavigationAgent3D

var last_time_pterg_pos_chg : float
var time_reach_targ_pos : float

@export_group("Behavior")

# entity mode 
@export_subgroup("Choose Behavior")
@export var pMode : passiveMode
@export var aMode : aggressiveMode
@export var tMode : targetingMode


# variable for camp behavior in passive mode
@export_subgroup("Camp passive mode")
@export var spawn_point : Vector3
@export var radius : float

# variable for following path behavior in passive mode
@export_subgroup("Following path passive mode")
@export var list_of_position : Array
@export var current_position_in_list : int
@export var reverse : int

# variable for aggressive mode
@export_subgroup("Aggressive mode")
var position_status_change : Array
@export var cac_distance : int
@export var dist_distance : int
@export var stop_feeling_distance : int


func movement()->Vector3:
	var res : Vector3
	if isTrackingPlayer == true:
		res = aggressive_movement()
		print("res aMode", res)
	else:
		res = passive_movement()
		print("res pMode", res)
	return res



func aggressive_movement() -> Vector3:
	var res : Vector3
	var player_position = get_parent_node_3d().get_node("Player").global_position
	if aMode == aggressiveMode.STILL:
		res = MovementAggressive.stillBehavior(position)
	elif aMode == aggressiveMode.FEELING:
		res = MovementAggressive.fleeingBehavior(position, player_position, stop_feeling_distance)
	elif aMode == aggressiveMode.DISTANCE:
		res = MovementAggressive.distanceBehavior(position, player_position, position_status_change)
	elif aMode == aggressiveMode.CAC:
		res = MovementAggressive.cacBehavior(position, player_position, position_status_change)
	elif aMode == aggressiveMode.DISTCAC:
		res = MovementAggressive.cacDistBehavior(position, player_position, position_status_change)
	else:
		res = position
	return res
	

func passive_movement()->Vector3:
	var res : Vector3
	if pMode == passiveMode.STILL:
		res = MovementPassive.stillBehavior(position)
	elif pMode == passiveMode.CAMP:
		res = MovementPassive.campBehavior(position, rotation, spawn_point, radius)
	elif  pMode == passiveMode.FOLLOWING_PATH:
		var tmp = MovementPassive.followingPathBehavior(list_of_position, current_position_in_list, reverse)
		res = tmp[0]
		current_position_in_list = tmp[1]
		reverse = tmp[2]
	else:
		res = position
	return res


func setTarget():
	if tMode == targetingMode.NEAR:
		if Movement.distanceVect(position, get_parent_node_3d().get_node("Player").global_position) < position_status_change[2]:
			isTrackingPlayer = true
		else :
			isTrackingPlayer = false
			
	
	
func set_new_pos()->void:
	if Time.get_ticks_msec()- time_reach_targ_pos > 3000:
		navigation_agent_3d.target_position = movement()
		last_time_pterg_pos_chg = Time.get_ticks_msec()
		time_reach_targ_pos = Time.get_ticks_msec()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = hpMax; #hp initialization
	isTrackingPlayer = true
	last_time_pterg_pos_chg = Time.get_ticks_msec()
	time_reach_targ_pos = Time.get_ticks_msec()
	position_status_change = [cac_distance, dist_distance]
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_on_floor() == false:
		velocity += get_gravity() * delta
	
	setTarget()
	
	
	if isTrackingPlayer == false:
		if pMode == passiveMode.CAMP:
			if navigation_agent_3d.is_navigation_finished() or Time.get_ticks_msec()-last_time_pterg_pos_chg > 5000 :
				set_new_pos()
		return
	else:
		set_new_pos()
		return
	
	
	velocity = global_position.direction_to(navigation_agent_3d.get_next_path_position()) * speed
		
	move_and_slide()
	
