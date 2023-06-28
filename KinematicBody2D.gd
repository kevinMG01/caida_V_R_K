extends CharacterBody2D


var cantidad = 150
var movimiento = Vector2()


var jugador = null


var jugador_abajo = null
var cantidad_abajo = 170



func _physics_process(delta):
<<<<<<< Updated upstream
	movimiento = Vector2()
	deteccion_seguir()
	deteccion()
	movimiento = move_and_slide(movimiento)
=======
	move()
	set_velocity(movimiento)
	move_and_slide()
	movimiento = velocity
	movimiento.x = lerp(movimiento.x,0,0.21)
	
	
	if comenzar_rot == true:
		get_node("CollisionShape2D").rotate(speed)
	if comenzar_rot == true:
		get_node("Sprite2D").rotate(speed)
	pass

func move():
#	var cantidad = 5
	if comensar == true:
>>>>>>> Stashed changes
		
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

