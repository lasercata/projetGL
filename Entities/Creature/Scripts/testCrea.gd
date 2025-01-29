class_name TestCrea

extends Creature

const SPEED = 5.0
const JUMP_VELOCITY = 4



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	pMode = passiveMode.CAMP
	aMode = aggressiveMode.STILL
	spawn_point = global_position
	radius = 10
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
	
	
	
	
func isPlayerNearby(player: Node3D) -> int:
	var monster_position = global_position
	var player_position = player.global_position
	var d = player_position.distance_to(monster_position)
	return d



func _on_area_3d_area_entered(area: Area3D) -> void:
	hp -= 3 # prends 3 de dégats à chaque fois que qqchose entre dans sa zone
