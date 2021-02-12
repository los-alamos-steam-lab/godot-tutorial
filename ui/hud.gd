extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# update the sprite frame to be the player keys
	$keys.frame = get_node("../player").keys
