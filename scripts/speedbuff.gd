extends Node2D

var sec = 0

func _process(_delta):
	if sec >= 15:
		queue_free()

func _on_detect_collect_body_entered(body):
	if body.has_method("player"):
		global.speed += 20
		print("speed increased")
		print("Speed is now " + str(global.speed))
		queue_free()



func _on_timer_timeout():
	sec += 1
