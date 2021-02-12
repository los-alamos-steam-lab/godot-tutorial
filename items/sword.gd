extends Node2D

var TYPE = null
var DAMAGE = 0.5

#number of the item that can be owned by a single entity on the screen
var maxamount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	# find out who is holding the sword
	TYPE = get_parent().TYPE
	
	# when the animation finsishes, call the function "destroy"
	$anim.connect("animation_finished", self, "destroy")
	
	#animate the sword
	$anim.play(str("swing", get_parent().spritedir))
	
	# if the parent has a state definted for swing, then set it
	if get_parent().has_method("state_swing"):
		get_parent().state = "swing"
	
func destroy(animation):	
	# if the parent has a state definted for swing, then unset it
	if get_parent().has_method("state_swing"):
		get_parent().state = "default"
	
	#delete the item
	queue_free()

