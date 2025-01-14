extends Node

signal hit_by_ennemy(damage)

func _on_area_3d_body_entered(body):
	print("Collision détectée avec :", body.name)

	if (body.name == "Creature"):
		emit_signal("hit_by_ennemy", body.damage)


#func _on_area_3d_body_exited(body):
#	if (body.name == "Creature"):
#		emit_signal("hit_by_ennemy", body.damage)
