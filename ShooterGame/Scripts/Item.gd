extends Area2D

var item_duration
var itemType = 'speed'

func _on_Item_body_entered(body):
	$SFX.play()
	Global.Player.collect_item(itemType)
	visible = false

func _on_SFX_finished():
	queue_free()
