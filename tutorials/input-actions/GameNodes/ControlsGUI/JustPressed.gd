extends AnimatedSprite

func _ready():
	$Timer.connect("timeout", self, "reset")

func press():
	$Timer.start()
	play("active")

func reset():
	$Timer.stop()
	play("default")
