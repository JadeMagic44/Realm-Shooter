extends Node2D

func _ready():
	global.reset(2)

func _process(_delta):
	if global.score == 75 and global.world == 2:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
