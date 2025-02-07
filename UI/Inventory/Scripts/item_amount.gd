
extends Object
class_name ItemAmount

# modification de la classe item probable, revoir inventory après
var amount: int = 0
var item: Item = null

func _init(_item: Item,_amount: int) -> void:
	amount = _amount
	item = _item
