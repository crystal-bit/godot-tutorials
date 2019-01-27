extends Node2D

onready var player = get_node("../../AnimatedSprite")
onready var just_pressed: AnimatedSprite = get_parent().get_node("ActionsVisualFeedback/JustPressed") 
onready var just_released: AnimatedSprite = get_parent().get_node("ActionsVisualFeedback/JustReleased")
onready var pressed: AnimatedSprite = get_parent().get_node("ActionsVisualFeedback/Pressed") 

func _process(delta):	
	if Input.is_action_pressed("shoot"):
		pressed.play("active")
		$Square.show()
		$Rest/Square.hide()
	else:
		pressed.play("default")
		$Square.hide()
		$Rest/Square.show()
	
	if Input.is_action_just_pressed("shoot"):
		just_pressed.press()
		
	if Input.is_action_just_released("shoot"):
		just_released.release()
		
	
func _hide_all():
	$Rest/Square.hide()
	$Square.hide()