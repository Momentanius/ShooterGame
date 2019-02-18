extends Area2D

var item_duration
var itemPoints = 100
var canBeCollected = true

func _ready():
	Global.Item = self

func _on_Item_body_entered(body):
	if canBeCollected:
		canBeCollected = false
		Global.Player.collect_item(itemPoints)
		queue_free()
