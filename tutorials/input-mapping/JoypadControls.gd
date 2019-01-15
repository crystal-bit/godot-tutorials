extends Node2D

onready var player = get_node("../../AnimatedSprite")

func _process(delta):	
	# if UP button pressed
	if Input.is_joy_button_pressed(0, 12):
		$Up.show()
		$Rest/Up.hide()
	else:
		$Up.hide()
		$Rest/Up.show()
	# if DOWN button pressed
	if Input.is_joy_button_pressed(0, 13):
		$Down.show()
		$Rest/Down.hide()
	else:
		$Down.hide()
		$Rest/Down.show()
	# If LEFT button pressed
	if Input.is_joy_button_pressed(0, 14):
		$Left.show()
		$Rest/Left.hide()
	else:
		$Left.hide()
		$Rest/Left.show()
	# If RIGHT button pressed
	if Input.is_joy_button_pressed(0, 15):
		$Right.show()
		$Rest/Right.hide()
	else:
		$Right.hide()
		$Rest/Right.show()

func _input(event):
	if event is InputEventJoypadButton:
		print("Il pulsante premuto ha codice = ", event.button_index)
	
func _hide_all():
	$Down.hide()
	$Up.hide()
	$Left.hide()
	$Right.hide()
	$Rest/Right.show()
	$Rest/Left.show()
	$Rest/Up.show()
	$Rest/Down.show()

func _press_direction(direction):
	if direction.x > 0:
		$Right.show()
		$Rest/Right.hide()
	if direction.x < 0:
		$Left.show()
		$Rest/Left.hide()
	if direction.y > 0:
		$Down.show()
		$Rest/Down.hide()
	if direction.y < 0:
		$Up.show()
		$Rest/Up.hide()
