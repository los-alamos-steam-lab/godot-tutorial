extends Camera2D

var WIDTH = 160
var HEIGHT = 128

func _ready():
	# when a body enters or exits, call a function
	$area.connect("body_entered", self, "body_entered")
	$area.connect("body_exited", self, "body_exited")
	
func _process(delta):
	# Find the position of the player (which means it has to be on the 
	# same level in the scene tree
	var pos = get_node("../player").global_position - Vector2(0, 16)
	
	# use the floor to find the grid position of the player
	# and then multipy to put the camera in the proper spot in the scene
	var x = floor(pos.x/WIDTH) * WIDTH	
	var y = floor(pos.y/HEIGHT) * HEIGHT
	global_position = Vector2(x, y)

func body_entered(body):
	# make the enemies move when they enter the camera
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(true)
		
func body_exited(body):
	# make the enemies stope when they leave the camera
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(false)
