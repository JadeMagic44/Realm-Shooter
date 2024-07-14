extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
var spawnTimer = 2
@onready var spawn_timer = $spawnTimer
@onready var player = global.playerBody

func _on_spawn_timer_timeout():
	var enemy = loadEnemy.instantiate()
	spawn_location(150, enemy)
	add_child(enemy)
	print(spawnTimer)
	var position = Vector2(player.position)


func _on_count_timer_timeout():
	if spawnTimer > 0.5:
		spawnTimer -= 0.25
	spawn_timer.set_wait_time(spawnTimer)
	
func spawn_location(playerDistance, enemy):
	var playerx1 = Vector2(player.position)[0] - playerDistance
	var playerx2 = Vector2(player.position)[0] + playerDistance
	var playery1 = Vector2(player.position)[1] - playerDistance
	var playery2 = Vector2(player.position)[1] + playerDistance
	enemy.position = Vector2(randi_range(200, 700), randi_range(200, 700))
	while enemy.position[0] > playerx1 and enemy.position[0] < playerx2 and enemy.position[1] > playery1 and enemy.position[1] < playery2:
		enemy.position = Vector2(randi_range(200, 700), randi_range(200, 700))
