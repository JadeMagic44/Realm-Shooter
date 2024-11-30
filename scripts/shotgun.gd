extends Node2D

var sec = 0

func _process(_delta):
	if sec >= 10:
		queue_free()

func _on_detect_collect_body_entered(body):
	if body.has_method("player"):
		global.shotgun = !global.shotgun
		print("Rip and Tear")
		queue_free()
		


func _on_timer_timeout():
	sec += 1
