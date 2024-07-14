extends CharacterBody2D

var dir = Vector2()
const SPEED = 300

func _physics_process(delta):
	
	var _collisonInfo = move_and_collide(dir.normalized() * delta * SPEED)





func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func bullet():
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		queue_free()
		global.score += 1
