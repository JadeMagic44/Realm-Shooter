extends Node2D


func _on_yes_pressed():
	get_tree().quit()


func _on_no_pressed() -> void:
	match global.world:
		0:
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		1:
			get_tree().change_scene_to_file("res://scenes/space.tscn")
