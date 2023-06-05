extends Node2D

var spawn_positions = null

var Obstacle = preload("res://characters/Obstacles/Cloud.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_obstacle():
	var index = randi() % spawn_positions.size()
	var obstacle = Obstacle.instance()
	obstacle.global_position = spawn_positions[index].global_position
	add_child(obstacle)


func _on_SpawnTimer_timeout():
	spawn_obstacle()
