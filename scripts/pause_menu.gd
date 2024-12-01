extends Control

@onready var main = $"../.."

func _on_reset_pressed():
	get_tree().reload_current_scene()
	global.score = 0
	global.shotgun = false
	global.speed = 200


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quiting_in_game.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
