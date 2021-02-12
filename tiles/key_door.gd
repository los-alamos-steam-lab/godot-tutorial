extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$area.connect("body_entered", self, "body_entered")
	
func body_entered(body):
	# I replace body.get(keys) with body.keys because I want this 
	# to fail if the player does not have a keys variable
	if body.name == "player" && body.keys > 0:
		# Use a key and then delete the door.
		body.keys -= 1
		queue_free()
