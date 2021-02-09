extends entity

var movetimer_length = 15
var movetimer = 0

# ready function lets us set "constants" and perform 
# other actions when the file loads
func _ready():
	SPEED = 40
	DAMAGE = 1
	$anim.play("default")
	movedir = dir.rand()
	
	#This calls the ready function in the parent script	
	._ready()
	
func _physics_process(delta):
	movement_loop()
	damage_loop()
	
	# count down the movetimer every tick
	if movetimer > 0:
		movetimer -= 1
		
	# if the movetime reaches zero or the stalfos is on a wall
	# change direction and reset the timer
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length


