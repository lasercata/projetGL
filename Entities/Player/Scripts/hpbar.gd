extends Sprite3D


@export var player = PlayerScript.new()

var current_hp : float 
var maxHP : float 

func _ready():
	current_hp = player.stats.HP;
	maxHP = player.stats.HP;
	texture.gradient.set_offset(1,current_hp/maxHP)

func _process(delta):
	#print(current_hp/player.stats.HP)
	
	#value is between 0 (0 hp) and 1 (full hp)
	texture.gradient.set_offset(1,current_hp/maxHP)
	#print(current_hp/maxHP)


func _on_player_hit_by_ennemy(damage):
	current_hp -= damage;
	if (current_hp <= 0):
		get_tree().reload_current_scene()
