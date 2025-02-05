extends Node

class_name InventoryDataManager

var item_list: Array = []

signal item_added(item_amount)
signal item_removed(item_amount)

### BUILT-IN ###

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var __  = EVENTS.connect("object_collected", self, "_on_EVENTS_object_collected")
	pass

### LOGIC ###

func _append_item(item: Item, amount: int = 1) -> void:
	var item_amount_id = _find_item_id(item)
	var item_amount = null
	if (item_amount_id==-1):
		item_amount = ItemAmount.new(amount, item)
		item_list.append(item_amount)
	else : 
		item_amount = item_list[item_amount_id]
		item_amount.amount += amount
	emit_signal("item_added", item_amount)

func _remove_item(item: Item, amount: int = 1) -> void:
	var item_amount_id = _find_item_id(item)
	if (item_amount_id==-1):
		push_error("Could not remove item " + item.name + " from the list, not found in the inventory")
	else : 
		var item_amount = item_list[item_amount_id]
		item_amount.amount -= amount
		emit_signal("item_removed", item_amount)
		if (item_list[item_amount_id].amount <= 0):
			item_list.remove_at(item_amount_id)

# return the position of the item we want to add to inventory if we already have it
# return -1 if we don't have the item
func _find_item_id(item: Item) -> int:
	for i in range(item_list.size()):
		var item_amount = item_list[i]
		if item_amount.item == item:
			return i
	return -1


### DEBUG ###

func _print_inventory() -> void:
	print("--- INVENTORY CONTENT ---")
	print(" ")
	for item_amount in item_list:
		print(item_amount.item.name+ " : " + String(item_amount.amount))
	print(" ")
	print("-------------------------")

func _input(_event: InputEvent) -> void:
	if (Input.is_action_pressed("inventory")):
		_print_inventory()
		# toggle_inventory()

### SIGNALS ###

func _on_EVENTS_object_collected(item: Item) -> void: # A MODIFIER POUR AUTRES TYPES DE RESSOURCES (pièces, ...)
	_append_item(item)
