extends Node2D

func _ready():
	global.reset(1)
	
func _process(_delta):
	if global.score == 50 and global.world == 1:
		get_tree().change_scene_to_file("res://scenes/tank.tscn")
