extends Sprite3D


var hpMax : float
var currentHp : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


	hpMax = get_parent_node_3d().hpMax
	
	currentHp = get_parent_node_3d().hp
	
	#print(hpMax)
	#print("Hp Max: ", currentHp/hpMax)
	 
	
	texture.gradient.set_offset(1, currentHp/hpMax)
	
