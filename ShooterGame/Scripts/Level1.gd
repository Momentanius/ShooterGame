extends Node2D

var cameraSpeed = 5
var missedItems = 0

func _process(delta):
	auto_scroll()
	#create_random_item($Player)

func _ready():
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
	var new_pos = pos.get_global_transform_with_canvas()
	pass