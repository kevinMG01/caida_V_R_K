extends KinematicBody2D



var movimiento = Vector2()
var cantidad = 90
var gravity = 300

var jugador_libre = null

func _physics_process(delta):
	movimiento = move_and_slide(movimiento)
	movimiento.y = movimiento.y + gravity * delta
	pass


func move():
	
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x + 6:
			movimiento.x -= cantidad

		if global_position.x < jugador_libre.global_position.x - 6:
			movimiento.x += cantidad


	pass



func _on_deteccion_player_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	pass # Replace with function body.
