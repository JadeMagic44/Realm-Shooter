extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
var loadSpeed = preload("res://scenes/speedbuff.tscn")
var loadShotgun = preload("res://scenes/shotgun.tscn")
var minX = 16
var maxX = 1152 - 16
var minY = 16
var maxY = 648 - 16
@onready var spawn_timer = $spawnTimer
@onready var player = global.playerBody

var spawnTimer = 2

func _on_spawn_timer_timeout():
	var rng = randi_range(1,100)
	if rng >= 1 and rng <= 10:
		var speedBuff = loadSpeed.instantiate()
		spawn_location(150, speedBuff)
		add_child(speedBuff)
		print("Summoning Speed Buff")
	elif rng >= 11 and rng <= 15 and global.shotgun == false:
		var shotgun = loadShotgun.instantiate()
		spawn_location(300, shotgun)
		add_child(shotgun)
		print("Summoning Shotgun")
	else:
		var enemy = loadEnemy.instantiate()
		spawn_location(150, enemy)
		add_child(enemy)
		print("Summoning Enemy")


func _on_count_timer_timeout():
	if spawnTimer > 0.25:
		spawnTimer -= 0.25
	spawn_timer.set_wait_time(spawnTimer)
	print("Entities spawn every " + str(spawnTimer) + " seconds")
	
func spawn_location(playerDistance, entity):
	var playerx1 = Vector2(player.position)[0] - playerDistance
	var playerx2 = Vector2(player.position)[0] + playerDistance
	var playery1 = Vector2(player.position)[1] - playerDistance
	var playery2 = Vector2(player.position)[1] + playerDistance
	entity.position = Vector2(randi_range(minX, maxX), randi_range(minY, maxY))
	while entity.position[0] > playerx1 and entity.position[0] < playerx2 and entity.position[1] > playery1 and entity.position[1] < playery2:
		entity.position = Vector2(randi_range(minX, maxX), randi_range(minY, maxY))
