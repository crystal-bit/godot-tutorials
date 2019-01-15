extends Label

onready var connected_joypads = Input.get_connected_joypads()

func _ready():
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")

func _on_joy_connection_changed(device_id, connected):
	if connected:
		print("Connected: ", Input.get_joy_name(device_id))
		text = Input.get_joy_name(device_id)
	else:
		print("Joypad disconnected")
	
	
func _process(delta):
	if connected_joypads.size() > 0:
		text = Input.get_joy_name(connected_joypads[0])
