extends Node2D


func _on_yes_pressed() -> void:
	match global.world:
		1: 
			get_tree().change_scene_to_file("res://scenes/space.tscn")


func _on_no_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
