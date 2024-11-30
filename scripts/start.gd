extends Node2D
@onready var SB = $SB

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")	
	Engine.time_scale = 1


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quiting.tscn")




func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _process(_delta):
	if global.speed <= 220:
		pass
