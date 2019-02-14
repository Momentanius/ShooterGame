extends Node2D

var cameraSpeed = 5
var missedItems = 0
var createItem = true

var viewPortSize

const new_item = preload("res://Scenes/Item.tscn")

func _process(delta):
	auto_scroll()
	create_random_item($Player.position)

func _ready():
	viewPortSize = get_viewport_rect().size
	get_tree().call_group('interface', 'missedItems', missedItems)
	pass

func auto_scroll():
	$Camera2D.position.y -= cameraSpeed
	$Player.position.y -= cameraSpeed

func speed_up():
	cameraSpeed += 1

func gameOver():
	if missedItems >= 3:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	else:
		missedItems+=1
		get_tree().call_group('interface', 'missedItems', missedItems)

func create_random_item(pos):
	if createItem: #Se pode criar itens
		createItem = false #Não pode durante um tempo
		$TimerItem.start() #Começa o timer "de 3 segundos"
		var item = new_item.instance() #Cria uma instância de um item, e armazena ele em item.
		var cameraPos = $Camera2D.get_global_transform_with_canvas()
		var randomPos = rand_range(100, viewPortSize.x - 200)
		print(randomPos)
		item.global_position.x = randomPos  #seta a posição deste novo item como a posição sorteada
		if cameraSpeed < 10:
			item.global_position.y =  $Player.position.y - (cameraPos[2][1] * 2)   #same shit with Z
		else:
			item.global_position.y =  $Player.position.y - (cameraPos[2][1] * 3)   #same shit with Z
		get_parent().add_child(item)


func _on_TimerItem_timeout():
	createItem = true
