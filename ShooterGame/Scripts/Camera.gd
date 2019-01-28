extends Camera2D

func _ready():
	set_process(true)

func _process(delta):
	var pos = get_camera_position() # pega a posição da camera
	position = Vector2(pos.x, pos.y)

