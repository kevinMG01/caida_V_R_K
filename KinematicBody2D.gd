extends KinematicBody2D


var cantidad = 200
var movimiento = Vector2()


var jugador = null


var jugador_abajo = null
var cantidad_abajo = 170



func _physics_process(delta):
	movimiento = Vector2()
	deteccion_seguir()
	deteccion()
	movimiento = move_and_slide(movimiento)
		
func deteccion():
	if jugador != null:
		if global_position.x > jugador.global_position.x + 6:
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
		if global_position.x < jugador.global_position.x - 6:
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false

func deteccion_seguir():
	
	if jugador_abajo != null:
		movimiento = position.direction_to(jugador_abajo.position)
	else:
		movimiento = Vector2()
	movimiento = movimiento.normalized()* cantidad_abajo


func _on_lateral_body_entered(body):
	if body.get_name() == "Player":
		jugador = body

func _on_lateral_body_exited(body):
	jugador = null

func _on_abajo_body_entered(body):
	if body.get_name() == "Player":
		jugador_abajo = body

func _on_abajo_body_exited(body):
	jugador_abajo = null

