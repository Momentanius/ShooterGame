extends Camera2D



func _on_Area2D_area_entered(area):
	$Area2D/SFX.play()
	get_tree().call_group('Speed', 'gameOver')
	area.queue_free()
