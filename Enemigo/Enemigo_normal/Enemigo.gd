extends KinematicBody2D


var cantidad = 165
var movimiento = Vector2()


var jugador = null


func _physics_process(delta):
	movimiento = Vector2()
	deteccion()
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

func _on_Area2D_body_exited(body):
	jugador = null
	yield(get_tree().create_timer(2),"timeout")
	self.queue_free()
