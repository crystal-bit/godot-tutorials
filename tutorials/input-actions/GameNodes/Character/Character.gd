extends AnimatedSprite

var power = 1  # this variable can be used as a multiplier for the attack damage in a combat system 

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		play("aim")
		$Arrow.reset_position()
		$Arrow.show()
	
	if Input.is_action_just_released("shoot"):
		play("rest")
		$Arrow.fire()
		power = 1
	
	if Input.is_action_pressed("shoot"):
		power += 1
		print(power)
