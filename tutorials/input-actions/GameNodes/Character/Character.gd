extends AnimatedSprite

onready var label_power : Label = $Power as Label
var loading_power : bool = false
var power_per_second : float = 10
var power : float = 1  # this variable can be used as a multiplier for the attack damage in a combat system

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_action_just_pressed("shoot"):
			# Set player animation
			play("aim")

			# Set arrow state
			$Arrow.reset_position()
			$Arrow.show()

			# Init loading power
			label_power.visible = true
			loading_power = true

		if Input.is_action_pressed("shoot"):
			pass

		if Input.is_action_just_released("shoot"):
			# Set player animation
			play("rest")

			# Set arrow state
			$Arrow.fire()

			# Restore arrow power
			label_power.visible = false
			loading_power = false
			power = 1


func _process(delta):
	if loading_power:
		label_power.text = "POWER: " + ("%.2f" % power)
		power += power_per_second * delta
