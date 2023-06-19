extends NinePatchRect

onready var text := $RichTextLabel
onready var timer := $Timer

var msg_queue: Array = [
	"Importante: Você está passando pela estratosfera no momento. Essa camada da atmosfera é rica em ozônio e pobre em oxigênio. Lembre-se de utilizar uma máscara de O² para seguir sua jornada!!!"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	show_message()
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()

func show_message() -> void:
	if(msg_queue.size() == 0):
		hide()
		return
	
	var _msg: String = msg_queue.pop_front()
	
	text.visible_characters = 0
	text.bbcode_text = _msg
	timer.start()


func _on_Timer_timeout():
	if text.visible_characters == text.bbcode_text.length():
		timer.stop()
	text.visible_characters += 1
