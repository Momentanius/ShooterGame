extends Area2D

var item_duration
var itemType = 'speed'

func _ready():
	pass

func _on_Item_body_entered(body):
	Global.Player.collect_item(itemType)
	queue_free()