extends Area2D
class_name GameBorders

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if not body.is_shield:
			body.queue_free()
			
			GameLoop.player_died.emit()
