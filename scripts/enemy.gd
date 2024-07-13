extends CharacterBody2D

const SPEED = 100
var dir: Vector2
var player: CharacterBody2D
var score = global.score

func  _process(_delta):
	player = global.playerBody
	velocity = position.direction_to(player.position) * SPEED
	
	look_at(player.position)
	move_and_slide()


func _on_detect_impact_body_entered(body):
	if body.has_method("bullet"):
		score += 1
		queue_free()

func enemy():
	pass
