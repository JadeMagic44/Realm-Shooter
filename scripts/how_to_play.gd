extends Node2D


@onready var label: Label = $Landmine/Label
@onready var shotgun = $shotgun
@onready var speed = $speed
@onready var enemy = $enemy
@onready var landmine = $Landmine
var text = ["landmine", "blackhole", "anti-tank landmine"]
var loaded = [load("res://Assets/power ups/shotgun/Shotgun.png"), load("res://Assets/power ups/shotgun/SGI.png"), load("res://Assets/power ups/shotgun/tankShotgun.png"), load("res://Assets/power ups/speed/runningMan.png"), load("res://Assets/power ups/speed/chevron.png"), load("res://Assets/power ups/speed/Jerry can.pngg"), load("res://Assets/enemy/enemy.png"), load("res://Assets/enemy/UFO.png"), load("res://Assets/enemy/RedTank.png"), load("res://Assets/enemy/landmine.png"), load("res://Assets/enemy/BlackHole.png"), load("res://Assets/enemy/anti-tank landmine.png")]

func _on_return_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")




func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _process(_delta):
	match global.world:
		0:
			shotgun.texture = loaded[0]
			speed.texture = loaded[3]
			enemy.texture = loaded[6]
			landmine.texture = loaded[9]
			label.text = "if your score is 50 or above " + str(text[0]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
			
		1:
			shotgun.texture = loaded[1]
			speed.texture = loaded[4]
			enemy.texture = loaded[7]
			landmine.texture = loaded[10]
			label.text = "if your score is 50 or above " + str(text[1]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
		2:
			shotgun.texture = loaded[2]
			speed.texture = loaded[5]
			enemy.texture = loaded[8]
			landmine.texture = loaded[11]
			label.text = "if your score is 50 or above " + str(text[2]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
		_:
			
			label.text = "if your score is 50 or above " + str(text[0]) + " start to spawn if you touch them the game ends they are on a timer after the timer ends they despawn"
