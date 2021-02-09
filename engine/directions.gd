class_name directions
extends Node

# We didn't add the constants here because they are built into 
# Vector2 after 3.1

# return a random direction 
func rand():
	var d = randi() % 4 
	match d:
		0:
			return Vector2.LEFT
		1:
			return Vector2.RIGHT
		2:
			return Vector2.UP
		3:
			return Vector2.DOWN
			


