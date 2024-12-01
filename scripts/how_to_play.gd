extends Node2D


@onready var label: Label = $Landmine/Label
@onready var shotgun = $shotgun
@onready var speed = $speed
@onready var enemy = $enemy
@onready var landmine = $Landmine
var text = ["landmine", "blackhole"]
var loaded = [load("res://Assets/Shotgun.png"), load("res://Assets/SGI.png"), load("res://Assets/runningMan.png"), load("res://Assets/speed.png"), load("res://Assets/enemy.png"), load("res://Assets/UFO2.png"), load("res://Assets/landmine.png"), load("res://Assets/BlackHole.png")]

func _on_return_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _process(_delta):
	match global.world:
		0:
			shotgun.texture = loaded[0]
			speed.texture = loaded[2]
			enemy.texture = loaded[4]
			landmine.texture = loaded[6]
			label.text = "if your score is 50 or above " + str(text[0]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
			
		1:
			shotgun.texture = loaded[1]
			speed.texture = loaded[3]
			enemy.texture = loaded[5]
			landmine.texture = loaded[7]
			label.text = "if your score is 50 or above " + str(text[1]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
		_:
			label.text = "if your score is 50 or above " + str(text[0]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
