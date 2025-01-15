extends Sprite3D

@export var player = PlayerScript.new()

var current_mana


func _ready():
	current_mana = player.mana;

func _process(delta):
	#print(current_mana/player.manaMax)
	
	#value is between 0 (0 hp) and 1 (full hp)
	texture.gradient.set_offset(1,current_mana/player.manaMax)
