extends Timer
@export var Asteroidenfeld: Node2D
@export var Energie: Node2D

var erzeugteAsteroiden: int

func _init() -> void:
	Ereignisse.connect("start",_on_start)
	Ereignisse.connect("gameover",_on_gameover)
	
func _on_timeout() -> void: 
	erzeugteAsteroiden+=1
	var schwierigkeit = erzeugteAsteroiden/20
	var a=randi_range(1,get_child_count())
	var newAsteroid:RigidBody2D=get_child(a-1).duplicate()
	newAsteroid.visible=true
	newAsteroid.position.x=1700
	newAsteroid.position.y=randi_range(20,880)
	newAsteroid.name=get_child(a-1).name
	if a == 5:
		Energie.add_child(newAsteroid)
	else:
		Asteroidenfeld.add_child(newAsteroid)
	if schwierigkeit > 0:
		newAsteroid.apply_impulse(Vector2(-randf_range(300+schwierigkeit,300+schwierigkeit*100),randi_range(-100,100)))
	else:
		newAsteroid.apply_impulse(Vector2(-randf_range(300+schwierigkeit,300+schwierigkeit*100),0))
	Ereignisse.emit_signal("punkte",(schwierigkeit+1)*10)
	
func _on_start():
	erzeugteAsteroiden = 0
	start()
		
func _on_gameover():
	stop()
	
