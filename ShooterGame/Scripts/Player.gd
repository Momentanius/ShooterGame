extends KinematicBody2D

var motion = Vector2() #Vector2 são utilizados para criar movimentação em planos 2D

var can_shoot = true

const AUTO_SPEED = 100
const bullet_laser = preload("res://Tiro.tscn")
var SPEED = 600 #velocidade de movimento do jogador

func _ready():
	Global.Player = self
	get_tree().call_group("interface", "update_speed", SPEED)


func _physics_process(delta):
	move()
	move_and_slide(motion)

func _process(delta):
	shoot()

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

func shoot():
	if can_shoot:
		if Input.is_action_pressed('ui_shoot'):
			can_shoot = false
			$Timer.start()
			var bullet = bullet_laser.instance() #Instancia a bala como um novo item
			bullet.global_position = global_position #seta a posição da bala igual a posição base do jogador
			get_parent().add_child(bullet) #adiciona a bala como criança de player.

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
	if SPEED < 1200:
		SPEED +=150 
		
func _on_Timer_timeout():
	can_shoot = true
