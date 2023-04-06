extends KinematicBody2D


var cantidad = 130
var movimiento = Vector2()

var jugador = null



func _physics_process(delta):
	movimiento = Vector2()
	
	deteccion()
	
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
	

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		jugador = body
		
		
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	jugador = null
	pass # Replace with function body.
