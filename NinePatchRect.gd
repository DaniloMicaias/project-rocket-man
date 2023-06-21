extends NinePatchRect

onready var text := $RichTextLabel
onready var timer := $Timer

var msg_queue: Array = [
	"Você tinha razão! A terra está chegando nos seus últimos momentos e a sua invenção irá salvá-lo (Pressione Espaço).", 
	"O apocalipse está em andamento e sua jornada rumo a Pandora, o planeta com condições suficientes para a vida, se inicia agora (Pressione Espaço).",
	" A cada trecho da sua viagem você coletará dados sobre o local onde está passando. Desvie dos obstáculos (W-A-S-D), aproveite a música e boa sorte. (Pressione Espaço para sua primeira coleta de dados)" , 
	"Importante: Você está passando pela estratosfera no momento. Essa camada da atmosfera é rica em ozônio e pobre em oxigênio. (Pressione Espaço)"
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
		get_tree().change_scene("res://Earth.tscn")
		return
	
	var _msg: String = msg_queue.pop_front()
	
	text.visible_characters = 0
	text.bbcode_text = _msg
	timer.start()


func _on_Timer_timeout():
	if text.visible_characters == text.bbcode_text.length():
		timer.stop()
	text.visible_characters += 1
