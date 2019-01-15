extends Node2D

# const SPRITE_SIZE = Vector2(16, 16)  # 16x16 pixels

onready var player = get_node("../../AnimatedSprite")

onready var sprite_regions = {
	"Left": {
		"not_pressed": $Left.region_rect,
		"pressed": _get_pressed_region($Left.region_rect)
	},
	"Right": {
		"not_pressed": $Right.region_rect,
		"pressed": _get_pressed_region($Right.region_rect),
	},
	"Up": {
		"not_pressed": $Up.region_rect,
		"pressed": _get_pressed_region($Up.region_rect),
	},
	"Down": {
		"not_pressed": $Down.region_rect,
		"pressed": _get_pressed_region($Down.region_rect),
	}
}

func _process(delta):	
	if Input.is_key_pressed(KEY_LEFT):
		set_pressed("Left", true)
	else:
		set_pressed("Left", false)
	if Input.is_key_pressed(KEY_RIGHT):
		set_pressed("Right", true)
	else:
		set_pressed("Right", false)
	if Input.is_key_pressed(KEY_UP):
		set_pressed("Up", true)
	else:
		set_pressed("Up", false)
	if Input.is_key_pressed(KEY_DOWN):
		set_pressed("Down", true)
	else:
		set_pressed("Down", false)
	
func set_pressed(direction, pressed):
	var node = get_node(direction)
	if pressed:	
		node.region_rect = sprite_regions[direction].pressed
	else:
		node.region_rect = sprite_regions[direction].not_pressed
	
func _get_pressed_region(region):
	return Rect2(
		region.position.x,
		region.position.y + 96,
		region.size.x,
		region.size.y
	)