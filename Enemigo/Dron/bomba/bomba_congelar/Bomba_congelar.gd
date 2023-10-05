extends KinematicBody2D



var movimiento = Vector2()
var cantidad = 6
var gravity = 200

var masa = 2

var jugador_libre = null

func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento, Vector2(0,-1))
	movimiento.y = gravity * masa
	pass

func move():
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x:
			movimiento.x -= cantidad 

		if global_position.x < jugador_libre.global_position.x:
			movimiento.x += cantidad

func _on_deteccion_player_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	pass

func _on_Timer_timeout():
	self.queue_free()
	pass # Replace with function body.


func _on_colicion_player_body_entered(body):
	if body.get_name() == "Player":
		$AnimatedSprite.playing = true
		$AnimatedSprite.animation = "explotar"
		yield(get_tree().create_timer(0,97),"timeout")
		self.queue_free()
	pass # Replace with function body.
