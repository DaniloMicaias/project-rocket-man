extends Control
onready var timer = $Timer
onready var texture_progress = $TextureProgress
onready var percentage

func _process(delta):
	if timer.get_time_left() > 0:
		percentage = ((1 - timer.get_time_left() / timer.get_wait_time()) *100)
		texture_progress.value = percentage
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://VictoryScreen.tscn")
