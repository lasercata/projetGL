extends Node2D

var content = [0, 'premierTruc', 'deuxiemeTruc', 'troisiemeTruc']
@onready var label = $Control/ColorRect/DebugMarginContainer/DebugVBoxContainer/content

func update_content(newContent):
	content = newContent
	
func _process(delta: float) -> void:
	content[0] += 1
	label.text = ('salut!\n')
	for item in content:
		label.text += (str(item)+'\n')
		
	
