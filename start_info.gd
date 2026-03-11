extends Label

func _init() -> void:
	Ereignisse.connect("gameover",_on_gameover)
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("space") and visible:
		hide()
		Ereignisse.emit_signal("start")
		
func _on_gameover():
	show()
