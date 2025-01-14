extends Sprite3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


	var hpMax = get_parent_node_3d().hpMax
	
	var currentHp = get_parent_node_3d().hp
	
	#print(hpMax)
	#print("Hp Max: ", currentHp/hpMax)
	 
	
	texture.gradient.set_offset(1, currentHp/hpMax)
	
