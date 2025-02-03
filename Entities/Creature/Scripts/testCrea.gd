class_name TestCrea

extends Creature

const SPEED = 3.0
const JUMP_VELOCITY = 4



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	speed = SPEED
	
	pMode = passiveMode.CAMP
	aMode = aggressiveMode.FEELING
	
	spawn_point = global_position
	radius = 10
	
	list_of_position = [Vector3(-10, 0, 10), Vector3(10, 0, 10), Vector3(10, 0, -10)]
	current_position_in_list = 0
	reverse = 1
	
	position_status_change = [5, 7.5, 10]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
	
	
	
	

func _on_area_3d_area_entered(area: Area3D) -> void:
	hp -= 3 # prends 3 de dégats à chaque fois que qqchose entre dans sa zone
