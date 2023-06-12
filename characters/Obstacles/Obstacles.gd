extends Area2D

export (int) var speed = 100

var hp = 1

func _physics_process(delta):
	global_position.y += (speed-50) * delta
	global_position.x += speed * delta

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func _on_Obstacles_area_entered(area):
	if area is Player:
		area.take_damage(1)
