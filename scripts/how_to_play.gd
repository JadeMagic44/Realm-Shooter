extends Node2D


func _on_return_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
