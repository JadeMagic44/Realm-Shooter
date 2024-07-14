extends Node2D


func _on_detect_collect_body_entered(body):
	if body.has_method("player"):
		global.shotgun = true
		print("Rip and Tear")
		queue_free()
		
