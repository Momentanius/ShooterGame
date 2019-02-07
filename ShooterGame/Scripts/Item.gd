extends Area2D

var item_duration


func _on_Item_body_entered(body):
	if body == Global.Player:
		body.SPEED += 100
		queue_free() # Deleta o baguio