extends Node2D

var devSpeed = load("res://Assets/runningMan.png")
var spaceSpeed = load("res://Assets/speed.png")
@onready var sprite = $Sprite2D
var sec = 0

func _process(_delta):
	if sec >= 15:
		queue_free()
	
	match global.world:
		0:
			sprite.texture = devSpeed
		1:
			sprite.texture = spaceSpeed

func _on_detect_collect_body_entered(body):
	if body.has_method("player"):
		global.speed += 20
		print("speed increased")
		print("Speed is now " + str(global.speed))
		queue_free()



func _on_timer_timeout():
	sec += 1
