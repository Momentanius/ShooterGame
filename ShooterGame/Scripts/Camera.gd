extends Camera2D

var Player

func _ready():
	Player = Global.Player

func _on_Area2D_body_entered(body):
	if body == Player:
		print("Player entrou")
	
