extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_viewport_rect().size / 2
	var crosshairSize = position.x / 50
	size = Vector2(crosshairSize, crosshairSize)
	pass
