extends KinematicBody2D

var motion = Vector2() #Vector2 são utilizados para criar movimentação em planos 2D

const AUTO_SPEED = 100
var SPEED = 600 #velocidade de movimento do jogador

func _ready():
	Global.Player = self
	get_tree().call_group("interface", "update_speed", SPEED)


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

func collect_item(itemtype):
	if itemtype == 'speed':
		var item = Node.new()
		item.set_name(itemtype)
		add_child(item)
		upgrade(itemtype)
		get_tree().call_group("interface", "update_speed", SPEED)

func upgrade(item):
	if item == 'speed':
		speed_up()
	else: 
		print('errorrrr')

func speed_up():
	SPEED +=300
	pass
