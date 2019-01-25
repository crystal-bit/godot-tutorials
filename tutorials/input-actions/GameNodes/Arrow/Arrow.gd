extends Sprite


var velocity = Vector2()
onready var starting_pos = position


func _process(delta):
	position += velocity*delta
	if position.x > 180:
		velocity = Vector2()
		position.x = 180
		

func fire():
	reset_position()
	velocity = Vector2(2500, 0)


func reset_position():
	position = starting_pos
