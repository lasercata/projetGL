class_name NPC

extends Entity

# @export name : String (already done in Node3d)

# Say if the npc is interacting with the player
func onInteraction() -> bool:
	pass
	return false

# Return the dialog of the npc, depending on where the player is in the conversation
func dialog(ligne: String) -> String:
	pass
	return ''

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
