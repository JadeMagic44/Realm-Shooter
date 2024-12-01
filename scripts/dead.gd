extends Node2D

@onready var death = $death


func _ready():
	death.play()
	Engine.time_scale = 0


func _on_try_again_pressed():
	match global.world:
		0:
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		1:
			get_tree().change_scene_to_file("res://scenes/space.tscn")
	global.score = 0
	global.speed = 200
	global.shotgun = false


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/quiting.tscn")


func _on_main_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
