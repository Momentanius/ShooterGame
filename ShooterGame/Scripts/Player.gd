extends KinematicBody2D

var motion = Vector2() #Vector2 são utilizados para criar movimentação em planos 2D

const AUTO_SPEED = 100
const SPEED = 600 #velocidade de movimento do jogador

func _ready():
	Global.Player = self


func _physics_process(delta):
	move()
	move_and_slide(motion)


func move():
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = -SPEED
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = SPEED
	else:
		motion.y = 0
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): 
		motion.x = -SPEED
	else:
		motion.x = 0
