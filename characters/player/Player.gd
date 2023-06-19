extends Area2D
class_name Player

onready var game_over := $NinePatchRect

var speed = 300

var input_vector = Vector2.ZERO
var hp = 3
	
func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		
func _on_Player_area_entered(area):
	if area.is_in_group("obstacles"):
		area.take_damage(1)
