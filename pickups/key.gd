extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "body_entered")
	
func body_entered(body):
	# I replace body.get(keys) with body.keys because I want this 
	# to fail if the player does not have a keys variable
	# I also made MAXKEYS a player constant to make it easier to change
	if body.name == "player" && body.keys < body.MAXKEYS:
		# Pickup the key and then delete it.
		body.keys += 1
		queue_free()

