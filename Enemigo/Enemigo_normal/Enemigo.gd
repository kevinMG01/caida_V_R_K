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


func _on_muerte_payer_body_entered(body):
	if body.get_name() == "Player":
		yield(get_tree().create_timer(0,5),"timeout")
		body.queue_free()
		get_tree().change_scene("res://Menu/Menu/Menu.tscn")
	pass # Replace with function body.
