extends Area2D


export (int) var speed = 60

func _physics_process(delta):
	global_position.y += speed * delta
