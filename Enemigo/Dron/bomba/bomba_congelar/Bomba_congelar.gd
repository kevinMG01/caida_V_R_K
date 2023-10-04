extends KinematicBody2D



var movimiento = Vector2()
var cantidad = 15
var gravity = 200

var jugador_libre = null

func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento)
	movimiento.y = movimiento.y + gravity * delta
	pass


func move():
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x + 6:
			movimiento.x -= cantidad
		
		if global_position.x < jugador_libre.global_position.x - 6:
			movimiento.x += cantidad
		
		if global_position.y > jugador_libre.global_position.y + 6:
			movimiento.y -= cantidad
		
		if global_position.y < jugador_libre.global_position.y - 6:
			movimiento.y += cantidad




func _on_deteccion_player_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	pass # Replace with function body.


func _on_Timer_timeout():
	self.queue_free()
	pass # Replace with function body.
