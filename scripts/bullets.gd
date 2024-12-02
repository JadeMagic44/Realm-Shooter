extends CharacterBody2D
@onready var sound = $shots
@onready var sprite = $Sprite2D
var devBullet = load("res://Assets/player/bullets/ammo.png")
var spaceBullet = load("res://Assets/player/bullets/laser.png")
var tankBullet = load("res://Assets/player/bullets/cannon.png")
var dir = Vector2()
const SPEED = 300

func _ready():
	pass

func _physics_process(delta):
	var _collisonInfo = move_and_collide(dir.normalized() * delta * SPEED)
	
	match global.world:
		0:
			sprite.texture = devBullet
			# sound.stream = devSound
		1:
			sprite.texture = spaceBullet
			# sound.stream = spaceSound
		2:
			sprite.texture = tankBullet



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func bullet():
	pass


func _on_area_2d_body_entered(_body):
	pass
