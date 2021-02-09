extends KinematicBody2D

const SPEED = 70
var movedir = Vector2(0,0)
var spritedir = "down"

# _physics_process is called by the game engine
func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	print(spritedir)
	
	# We're setting our animation here.  I've replaced Vector2(0,-1)
	# with Vector2.UP for readability, and so forth.  These are new to godot 3.1 
	# I've also changed the order of the if statement to prioritize being
	# idle if movedir is zero and created a single (very long) if statement
	# for testing the push animation.

#	if movedir == Vector2.ZERO:
#		anim_switch("idle")
##	elif is_on_wall():
##		if (spritedir == "left" and test_move(transform, Vector2.LEFT))\
##		or (spritedir == "right" and test_move(transform, Vector2.RIGHT))\
##		or (spritedir == "up" and test_move(transform, Vector2.UP))\
##		or (spritedir == "down" and test_move(transform, Vector2.DOWN)):
##			anim_switch("push")
#	else: 
#		anim_switch("walk")
#
	
	
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
	move_and_slide(motion, Vector2.ZERO)
	
func spritedir_loop():
	match movedir:
		Vector2.LEFT:
			spritedir = "left"
		Vector2.RIGHT:
			spritedir = "right"
		Vector2.UP:
			spritedir = "up"
		Vector2.DOWN:
			spritedir = "down"
			
# This changes our player animation.  "animation" is a string 
# of the sort "idle", "push", or "walk"
func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)
	
	
