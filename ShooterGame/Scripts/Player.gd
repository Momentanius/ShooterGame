extends KinematicBody2D

var motion = Vector2() #Vector2 são utilizados para criar movimentação em planos 2D

var can_shoot = true
var totalPoints = 0

const AUTO_SPEED = 100
const bullet_laser = preload("res://Tiro.tscn")
var SPEED = 600 #velocidade de movimento do jogador

func _ready():
	Global.Player = self
	get_tree().call_group("interface", "getPoints", totalPoints)


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
		var item = Node.new()
		add_child(item)
		totalPoints += 100
		get_tree().call_group("interface", "getPoints", totalPoints)
		get_tree().call_group("Speed", "speed_up")
		

func _on_Timer_timeout():
	can_shoot = true
