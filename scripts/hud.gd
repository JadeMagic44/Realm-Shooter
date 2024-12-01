extends CanvasLayer

var sec = 0
var minute = 0
@onready var pause_menu = $PauseMenu
var paused = global.paused

func _process(_delta):
	
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
	
	$score.text = "score:" + str(global.score)
	if minute == 0:
		if sec < 10:
			$time.text = "0:0" + str(sec)
		else:
			$time.text = "0:" + str(sec)
	elif sec < 10:
		$time.text = str(minute) + ":0" + str(sec)
	else:
		$time.text = str(minute) + ":" + str(sec)
	

func countup():
	sec += 1
	if sec >= 60:
		minute += 1
		sec = 0
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
	
