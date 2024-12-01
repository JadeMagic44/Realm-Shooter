extends Node2D

func _ready():
	global.reset(0)
	
func _process(_delta):
	if global.score == 30 and global.world == 0:
		get_tree().change_scene_to_file("res://scenes/space.tscn")
