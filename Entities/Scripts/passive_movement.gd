class_name MovementPassive


static func stillBehavior(positionEntity : Vector3)->Vector3:
	return positionEntity
	

static func campBehavior(positionEntity : Vector3, rotationEntity : Vector3, spawnPosition : Vector3, rayon : int, SPEED)->Vector3:
	
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(-90.0, 90.0)
	
	rotationEntity = Vector3(rotationEntity[0], rotationEntity[1]+my_random_number, rotationEntity[2])

	
	var ux = cos(rotationEntity.y)
	var uy = sin(rotationEntity.y)
	
	var a = pow(ux,2) + pow(uy,2)
	var b = 2*((positionEntity[0]-spawnPosition[0])*ux + (positionEntity[2]-spawnPosition[2])*uy)
	var c = pow(positionEntity[0]-spawnPosition[0],2) + pow(positionEntity[2]-spawnPosition[2],2) - pow(rayon,2)

	var delta = b**2 - 4*a*c
	
	var distMax = (-b - sqrt(delta)) / (2*a)
	
	my_random_number = rng.randf_range(0, distMax)
	
	var new_pos_x = my_random_number*cos(rotationEntity.y) + positionEntity.x 
	var new_pos_z = my_random_number*sin(rotationEntity.y) + positionEntity.z
	
	return Vector3(new_pos_x, 0, new_pos_z)


static func followingPathBehavior(list_of_position, current_position : int, reverse : bool) -> :
	if reverse != null:
		if reverse == true:
			if current_position != 0:
				current_position -= 1
			else:
				current_position += 1
				reverse = !reverse
		else:
			if current_position != list_of_position.length:
				current_position += 1
			else:
				current_position -= 1
				reverse = !reverse
	else : 
		if current_position != list_of_position.length:
			current_position = 0
		else:
			current_position += 1 
	
	return
