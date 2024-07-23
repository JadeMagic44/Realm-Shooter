extends Node2D

var loadLandmine = preload("res://scenes/landmine.tscn")
var loadEnemy = preload("res://scenes/enemy.tscn")
var loadSpeed = preload("res://scenes/speedbuff.tscn")
var loadShotgun = preload("res://scenes/shotgun.tscn")
var minX = 16
var maxX = 1136
var minY = 16
var maxY = 632
@onready var spawn_timer = $spawnTimer
@onready var player = global.playerBody

var spawnTimer = 2

func _on_spawn_timer_timeout():
	var rng = randi_range(1,100)
	if rng >= 1 and rng <= 33 and global.speed <= 300:
		if global.speed > 300 and global.score <= 50:
			global.speed = 300
		var speedBuff = loadSpeed.instantiate()
		spawn_location(150, 500, speedBuff)
		add_child(speedBuff)
	elif rng >= 34 and rng <= 54 and global.score <= 50:
		var shotgun = loadShotgun.instantiate()
		spawn_location(300, 500, shotgun)
		add_child(shotgun)
	elif rng >= 34 and rng <= 44 and global.score >= 50:
		var landmine = loadLandmine.instantiate()
		spawn_location(200, 500, landmine)
		add_child(landmine)
	else:
		var enemy = loadEnemy.instantiate()
		spawn_location(150, 500, enemy)
		add_child(enemy)


func _on_count_timer_timeout():
	if spawnTimer > 0.25:
		spawnTimer -= 0.25
	spawn_timer.set_wait_time(spawnTimer)
	print("Entities spawn every " + str(spawnTimer) + " seconds")
	
func spawn_location(playerDistance, itemDistance, entity):
	var playerx1 = Vector2(player.position)[0] - playerDistance
	var playerx2 = Vector2(player.position)[0] + playerDistance
	var playery1 = Vector2(player.position)[1] - playerDistance
	var playery2 = Vector2(player.position)[1] + playerDistance
	var itemx1 = Vector2(player.position)[0] - itemDistance
	var itemx2 = Vector2(player.position)[0] + itemDistance
	var itemy1 = Vector2(player.position)[1] - itemDistance
	var itemy2 = Vector2(player.position)[1] + itemDistance
	entity.position = Vector2(randi_range(itemx1, itemx2), randi_range(itemy1, itemy2))
	while entity.position[0] > playerx1 and entity.position[0] < playerx2 and entity.position[1] > playery1 and entity.position[1] < playery2:
		entity.position = Vector2(randi_range(itemx1, itemx2), randi_range(itemy1, itemy2))
