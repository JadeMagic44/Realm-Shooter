extends Node2D

func _on_play_pressed():
	if global.world > 0:
		get_tree().change_scene_to_file("res://scenes/restart.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/main.tscn")	


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quiting.tscn")




func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _process(_delta):
	if global.speed <= 220:
		pass
