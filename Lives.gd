extends Node2D


func _ready():
	LiveCounter.lives = 3
	
func _physics_process(delta):
	if LiveCounter.lives == 2:
		$Live3.hide()
	if LiveCounter.lives == 1:
		$Live2.hide()
	if LiveCounter.lives == 0:
		get_tree().change_scene("res://GameOver.tscn")
