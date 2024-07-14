extends CanvasLayer

var sec = 0
var min = 0


func _process(delta):
	$score.text = "score:" + str(global.score)
