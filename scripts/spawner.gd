extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
var spawnTimer = 2
@onready var spawn_timer = $spawnTimer

func _on_spawn_timer_timeout():
	var enemy = loadEnemy.instantiate()
	enemy.position = Vector2(randi_range(200, 700), randi_range(200, 700))
	add_child(enemy)
	print(spawnTimer)



func _on_count_timer_timeout():
	if spawnTimer > 0.5:
		spawnTimer -= 0.5
	spawn_timer.set_wait_time(spawnTimer)
