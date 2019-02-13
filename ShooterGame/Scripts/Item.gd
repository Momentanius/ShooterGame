extends Area2D

var item_duration
var itemPoints = 100

func _ready():
	Global.Item = self

func _on_Item_body_entered(body):
	$SFX.play()
	Global.Player.collect_item(itemPoints)
	visible = false

func _on_SFX_finished():
	queue_free()
