extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
	
	paused = !paused
