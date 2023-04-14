extends KinematicBody2D


var cantidad = 200
var movimiento = Vector2()

var jugador = null

var jugador_abajo = null
var cantidad_abajo = 180

var nivel = 1


func _physics_process(delta):
	movimiento = Vector2()
	if nivel == 1:
		deteccion()
	if nivel == 2:
		deteccion_seguir()
	
	#if jugador != null:
	#	movimiento = position.direction_to(jugador.position)
	#else:
	#	movimiento = Vector2()
	
	#movimiento = movimiento.normalized()* cantidad
	movimiento = move_and_slide(movimiento)
		
func deteccion():
	if jugador != null:
		if global_position.x > jugador.global_position.x + 6:
			movimiento.x -= cantidad
		if global_position.x < jugador.global_position.x - 6:
			movimiento.x += cantidad
		if global_position.y < jugador.global_position.x - 6:
			movimiento.y += cantidad

func deteccion_seguir():
	
	if jugador_abajo != null:
		movimiento = position.direction_to(jugador_abajo.position)
	else:
		movimiento = Vector2()
	
	movimiento = movimiento.normalized()* cantidad_abajo
	
	pass

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		jugador = body
		
		


func _on_Area2D_body_exited(body):
	jugador = null
	pass # Replace with function body.





func _on_abajo_body_entered(body):
	if body.get_name() == "Player":
		jugador_abajo = body

func _on_abajo_body_exited(body):
	jugador_abajo = null