class_name Movement


static func angleRotation(x: float, z : float)->float:
	if x > 0:
		return atan(z/x)
	elif x > 0 and z >= 0:
		return atan(z/x) + 2*PI
	elif x < 0 and z < 0:
		return atan(z/x) + PI
	elif x == 0 and z > 0:
		return PI/2
	elif x == 0 and z < 0:
		return -PI/2
	else:
		return 0
