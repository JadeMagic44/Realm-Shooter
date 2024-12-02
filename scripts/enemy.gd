extends CharacterBody2D

var devEnemy = load("res://Assets/enemy/enemy.png")
var spaceEnemy = load("res://Assets/enemy/UFO.png")
var tankEnemy = load("res://Assets/enemy/RedTank.png")
@onready var sprite = $Sprite2D
const SPEED = 100
var dir: Vector2
var player: CharacterBody2D
@onready var death = $death

func _ready():
	global.enemyBody = self

func  _process(_delta):
	player = global.playerBody
	velocity = position.direction_to(player.position) * SPEED
	
	match global.world:
		0:
			sprite.texture = devEnemy
		1:
			sprite.texture = spaceEnemy
		2:
			sprite.texture = tankEnemy
			sprite.rotation_degrees = 90
			look_at(global.playerBody.global_position)
	
	move_and_slide()


func _on_detect_impact_body_entered(body):
	if body.has_method("bullet"):
		global.score += 1
		death.playing = true
		body.queue_free()
		queue_free()
		

func enemy():
	pass


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
