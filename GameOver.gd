extends Control

onready var text := $RichTextLabel

var msg_queue: Array = [
	"GAME OVER"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	show_message()
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()

func show_message() -> void:
	if(msg_queue.size() == 0):
		return
	
	var _msg: String = msg_queue.pop_front()
	text.bbcode_text = _msg




func _on_PlayAgain_pressed():
	get_tree().change_scene("res://Earth.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
