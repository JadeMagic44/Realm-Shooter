extends Node2D

var loadEnemy = preload("res://scenes/enemy.tscn")
@onready var count_timer = $countTimer

func _on_timer_timeout():
	var enemy = loadEnemy.instantiate()
	enemy.position = Vector2(randi_range(200, 700), randi_range(200, 700))
	add_child(enemy)



func _on_count_timer_timeout():
	pass # Replace with function body.
