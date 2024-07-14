extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
var loadSpeedBuff = preload("res://scenes/speedbuff.tscn")
var spawnTimer = 2
@onready var spawn_timer = $spawnTimer
@onready var player = global.playerBody
var minX = 16
var maxX = 1136
var minY = 16
var maxY = 632
func _on_spawn_timer_timeout():
	var rng = randi_range(1, 100)
	if rng >= 1 and rng <= 33:
		var speedBuff = loadSpeedBuff.instantiate()
		spawn_location(150, speedBuff)
		add_child(speedBuff)
		var position = Vector2(player.position)
	else:
		var enemy = loadEnemy.instantiate()
		spawn_location(150, enemy)
		add_child(enemy)
		var position = Vector2(player.position)	


func _on_count_timer_timeout():
	if spawnTimer > 0.5:
		spawnTimer -= 0.25
	spawn_timer.set_wait_time(spawnTimer)
	
func spawn_location(playerDistance, entity):
	var playerx1 = Vector2(player.position)[0] - playerDistance
	var playerx2 = Vector2(player.position)[0] + playerDistance
	var playery1 = Vector2(player.position)[1] - playerDistance
	var playery2 = Vector2(player.position)[1] + playerDistance
	entity.position = Vector2(randi_range(minX, maxX), randi_range(minY, maxY))
	while entity.position[0] > playerx1 and entity.position[0] < playerx2 and entity.position[1] > playery1 and entity.position[1] < playery2:
		entity.position = Vector2(randi_range(minX, maxX), randi_range(minY, maxY))
