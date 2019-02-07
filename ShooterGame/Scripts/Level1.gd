extends Node2D


func _process(delta):
	auto_scroll()

func auto_scroll():
	$Camera2D.position.y -= 5
	$Player.position.y -= 5
	
