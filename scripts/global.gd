extends Node

func reset(worldNum):
	global.world = worldNum
	Engine.time_scale = 1
	global.score = 0
	global.speed = 200
	global.shotgun = false

var score: int
var playerBody: CharacterBody2D
var enemyBody: CharacterBody2D
var speed = 200
var shotgun = false
var pos = 1
var paused = false
var world = 0
