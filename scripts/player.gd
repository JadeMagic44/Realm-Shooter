extends CharacterBody2D

var bulletPath = preload("res://scenes/bullet.tscn")
var speed = global.speed
var dir: Vector2

func _ready():
	global.playerBody = self

func _physics_process(_delta):
	velocity = dir * speed
	if Input.is_action_just_pressed("left_mouse_button"):
		print("shots fired")
		shoot()
	
	look_at(get_global_mouse_position())
	move_and_slide()



func _unhandled_input(_event: InputEvent):
	movement()


func movement():
	dir.x = Input.get_axis("left", "right")
	dir.y = Input.get_axis("up", "down")
	dir = dir.normalized()
	
func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	
	bullet.dir = get_global_mouse_position() - bullet.position


func _on_detect_impact_body_entered(body):
	if body.has_method("enemy"):
		get_tree().change_scene_to_file("res://scenes/dead.tscn")
