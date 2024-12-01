extends Node2D

func _ready():
	global.reset(2)

func _process(_delta):
	if global.score == 70 and global.world == 2:
		pass
