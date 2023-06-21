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
	
	# limit the player area to screen only
	var size = $Sprite.texture.get_size() * $Sprite.scale.y / 2
	var viewRect := get_viewport_rect()
	global_position.x = clamp(global_position.x,0+size.x,viewRect.size.x-size.x)
	global_position.y = clamp(global_position.y,0+size.y,viewRect.size.y-size.y)

func take_damage(damage):
	hp -= damage
	LiveCounter.lives -= damage
	if hp <= 0:
		queue_free()
		
func _on_Player_area_entered(area):
	if area.is_in_group("obstacles"):
		area.take_damage(1)
