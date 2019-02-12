extends RigidBody2D

var damage
var speed = Vector2(0, -600)

func _process(delta):
	move(delta)

func _ready():
	$SFX.play()

func move(delta):
	global_position += speed * delta

func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	
	print('nó saiu da tela')
	destroy()
