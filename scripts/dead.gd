extends Node2D


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	global.score = 0
	global.speed = 200
	global.shotgun = false


func _on_quit_pressed():
	get_tree().quit()


func _on_main_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
