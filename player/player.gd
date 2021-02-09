extends KinematicBody2D

const SPEED = 70
var movedir = Vector2(0,0)


# _physics_process is called by the game engine
func _physics_process(delta):
	controls_loop()
	movement_loop()
	
# controls_loop looks for player input
func controls_loop():
	var LEFT		= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN		= Input.is_action_pressed("ui_down")
	
	# By adding our values together, we make it so that one key 
	# stroke does not take precidence over another, i.e. pushing 
	# left and right keys at the same time
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
# movement_loop makes the character move
func movement_loop():
	# .normalized makes it so that diagonal movement is 
	# the same length as 4-driectional movement
	var motion = movedir.normalized() * SPEED
	
	# move_and_slide takes care of collisions and has you slide 
	# along walls that are blocking your path
	move_and_slide(motion, Vector2(0,0))
	
	
	
