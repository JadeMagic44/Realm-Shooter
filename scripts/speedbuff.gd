extends Node2D



func _on_detect_collect_body_entered(body):
	if body.has_method("player"):
		global.speed += 20
		print("speed increased")
		print("Speed is now " + str(global.speed))
		queue_free()
