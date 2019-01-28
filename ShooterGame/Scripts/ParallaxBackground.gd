extends ParallaxBackground

var screenSize

func _ready():
	screenSize = get_viewport_rect().size
	$ParallaxLayer/Sprite.region_rect

