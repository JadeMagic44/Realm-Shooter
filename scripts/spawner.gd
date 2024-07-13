extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
var timer = 0
var spawnTimer = 2
@onready var count_timer = $countTimer

func _on_spawn_timer_timeout():
	var enemy = loadEnemy.instantiate()
	enemy.position = Vector2(randi_range(200, 700), randi_range(200, 700))
	add_child(enemy)
	count_timer.set_wait_time(spawnTimer)
	print(timer)
	print(spawnTimer)



func _on_count_timer_timeout():
	timer += 1
	if timer % 30 == 0:
		spawnTimer -= 0.05
