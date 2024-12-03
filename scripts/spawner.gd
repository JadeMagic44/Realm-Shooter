extends Node2D

var loadLandmine = preload("res://scenes/landmine.tscn")
var loadEnemy = preload("res://scenes/enemy.tscn")
var loadSpeed = preload("res://scenes/speedbuff.tscn")
var loadShotgun = preload("res://scenes/shotgun.tscn")
#var minX = 16 # unused variables??
#var maxX = 1136
#var minY = 16
#var maxY = 632
@onready var spawn_timer = $spawnTimer
@onready var player = global.playerBody

var spawnTimer = 1
var count = 0 # for debug code
func _on_spawn_timer_timeout(): # randomly decide what to spawn with constraints
	var rng = randi_range(1,100)
	#while(count < 1000): # Debugging code
		#var speedBuff = loadEnemy.instantiate()
		#spawn_location(600, 900, speedBuff)
		#add_child(speedBuff)
		#count +=1
	if rng >= 1 and rng <= 10 and global.speed <= 300: # 10% chance spawn speed buff, stop spawning at 300 speed
		if global.speed > 300 and global.score <= 50:
			global.speed = 300
		var speedBuff = loadSpeed.instantiate()
		spawn_location(150, 500, speedBuff)
		add_child(speedBuff)
	elif rng >= 11 and rng <= 16 and global.score <= 50: # 5% chance spawn shotgun, stop spawning at over 50 score
		var shotgun = loadShotgun.instantiate()
		spawn_location(450, 800, shotgun)
		add_child(shotgun)
	elif rng >= 17 and rng <= 27 and global.score >= 50: # 5% chance spawn landmine after 50 score
		var landmine = loadLandmine.instantiate()
		spawn_location(450, 800, landmine)
		add_child(landmine)
	else:
		var enemy = loadEnemy.instantiate()
		spawn_location(600, 1000, enemy)
		add_child(enemy)


func _on_count_timer_timeout(): # Enemy spawn timer reducer
	if spawnTimer > 0.25: # cap min spawn timer at 0.25
		spawnTimer -= 0.25
	spawn_timer.set_wait_time(spawnTimer)
	print("Entities spawn every " + str(spawnTimer) + " seconds")
	
func spawn_location(playerDistance, itemDistance, entity):
	# create bounding boxes, playerDistance is the no spawn zone, while itemDistance is the spawn zone
	var playerx1 = Vector2(player.position)[0] - playerDistance
	var playerx2 = Vector2(player.position)[0] + playerDistance
	var playery1 = Vector2(player.position)[1] - playerDistance / 1.777777777777778 # compensate 16:9 screen size
	var playery2 = Vector2(player.position)[1] + playerDistance / 1.777777777777778
	var itemx1 = Vector2(player.position)[0] - itemDistance
	var itemx2 = Vector2(player.position)[0] + itemDistance
	var itemy1 = Vector2(player.position)[1] - itemDistance / 1.777777777777778
	var itemy2 = Vector2(player.position)[1] + itemDistance / 1.777777777777778
	# God i hope we find a way to refactor this ^^^^^^^
	# Randomize entity position in item bounding box (itemDistance)
	entity.position = Vector2(randi_range(itemx1, itemx2), randi_range(itemy1, itemy2))
	# Check if entity position is within player bounding box, if it is, reRandomize position within item bounding box
	# and check again
	while entity.position[0] > playerx1 and entity.position[0] < playerx2 and entity.position[1] > playery1 and entity.position[1] < playery2:
		entity.position = Vector2(randi_range(itemx1, itemx2), randi_range(itemy1, itemy2))
