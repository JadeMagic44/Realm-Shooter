extends CanvasLayer

var sec = 0
var min = 0


func _process(delta):
	$score.text = "score:" + str(global.score)
	if min == 0:
		if sec < 10:
			$time.text = "0:0" + str(sec)
		else:
			$time.text = "0:" + str(sec)
	elif sec < 10:
		$time.text = str(min) + ":0" + str(sec)
	else:
		$time.text = str(min) + ":" + str(sec)


func countup():
	sec += 1
	if sec >= 60:
		min += 1
		sec = 0
