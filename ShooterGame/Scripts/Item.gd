extends Area2D

var item_duration
var itemPoints = 100

func _ready():
	Global.Item = self

func _on_Item_body_entered(body):
	Global.Player.collect_item(itemPoints)
	queue_free()

