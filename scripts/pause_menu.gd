extends Control

@onready var main = $".."

func _on_resume_pressed():
	main.pauseMenu()


func _on_reset_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
