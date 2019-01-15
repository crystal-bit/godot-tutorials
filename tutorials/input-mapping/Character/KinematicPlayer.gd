extends AnimatedSprite

func _process(delta):
	var velocity = Vector2()
	
	# Keyboard input
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("shoot"):
		print("SHOOTING!")
		
	# update position
	# var movement = 250 * velocity.normalized() * delta
	# position += velocity * 300 * delta
	
	# update animation
	self.update_animated_sprite(velocity)
	

func update_animated_sprite(velocity):
	if velocity.x == -1:
		flip_h = false
		play('walk_left')
	elif velocity.x == 1:
		flip_h = true
		play('walk_left')
	elif velocity.y == -1:
		play('walk_up')
	elif velocity.y == 1:
		play('walk_down')
	if velocity == Vector2():
		if animation == 'walk_left':
			play('stand_left')
		elif animation == 'walk_up':
			play('stand_up')
		elif animation == 'walk_down':
			play('stand_down')