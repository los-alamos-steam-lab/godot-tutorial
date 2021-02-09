class_name entity
extends KinematicBody2D

# we put this here instead of autoloading it
# nothing wrong with autoload, but I prefer things in the code
var dir = directions.new()

# MOVEMENT
var movedir = Vector2.ZERO
var spritedir = "down"

onready var SPEED = 0

# Putting this here so that we can setup future calls from the 
# child scripts and not have them fail
func _ready():
	pass

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
