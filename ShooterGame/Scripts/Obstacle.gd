extends Area2D

export var damage = 0

func _on_Obstacle_body_entered(body):
	get_tree().call_group("player", "damage", damage)
	queue_free()
	
