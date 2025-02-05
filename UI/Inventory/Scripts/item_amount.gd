
extends Object
class_name ItemAmount

# modification de la classe item probable, revoir inventory après
var amount: int = 0
var item: Item = null

func _init(_amount: int, _item: Item) -> void:
	amount = _amount
	item = _item
