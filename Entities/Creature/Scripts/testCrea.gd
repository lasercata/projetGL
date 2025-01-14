class_name TestCrea

extends Creature


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = hpMax
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_on_floor() == false:
		velocity += get_gravity() * delta
	
	if is_on_floor() == true:
		velocity.y = 4
		
	move_and_slide()
