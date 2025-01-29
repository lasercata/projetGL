class_name TestCrea

extends Creature

const SPEED = 5.0
const JUMP_VELOCITY = 4
var hp : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = hpMax
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_on_floor() == false:
		velocity += get_gravity() * delta
	
	if hp <= 0:
		velocity.y = JUMP_VELOCITY
	
	else:
		var player = get_parent_node_3d().get_node("Player")
		var monster_position = global_position
		var player_position = player.global_position
			
		if isPlayerNearby(player) > 1.5 and isPlayerNearby(player) < 15 :
					
			var direction := (transform.basis * Vector3(player_position[0] - position.x, 0, player_position[2] - position.z)).normalized()
			
			if direction:
				velocity.x = direction.x * SPEED
				velocity.z = direction.z * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				velocity.z = move_toward(velocity.z, 0, SPEED)
				
		else:
			velocity.x = 0
			velocity.z = 0
			
	move_and_slide()
	
	
func isPlayerNearby(player: Node3D) -> int:
	var monster_position = global_position
	var player_position = player.global_position
	var d = player_position.distance_to(monster_position)
	return d
	



func _on_area_3d_area_entered(area: Area3D) -> void:
	hp -= 3 # prends 3 de dégats à chaque fois que qqchose entre dans sa zone
	if (hp <= 0):
		queue_free()
