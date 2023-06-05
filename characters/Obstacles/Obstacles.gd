extends Area2D


export (int) var speed = 100

func _physics_process(delta):
	global_position.y += (speed-50) * delta
	global_position.x += speed * delta
