extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$anim.play("default")
	
	# connect the animation finishing to the function "destroy" send it the animation
	$anim.connect("animation_finished", self, "destroy")
	
func destroy(animation):
	queue_free()
	


