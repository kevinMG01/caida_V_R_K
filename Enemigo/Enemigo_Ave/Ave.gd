extends KinematicBody2D


var cantidad = 130
var movimiento = Vector2()


var jugador = null
var jugador_libre = null

func _ready():
	$AnimatedSprite.playing = true
	pass
	

func _physics_process(delta):
	movimiento = Vector2()
	deteccion_laterales()
	deteccion_libre()
	movimiento = move_and_slide(movimiento)
		
func deteccion_laterales():
	if jugador != null:
		if global_position.x > jugador.global_position.x + 6:
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
		if global_position.x < jugador.global_position.x - 6:
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false

func deteccion_libre():
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x + 6:
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
		if global_position.x < jugador_libre.global_position.x - 6:
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false
		if global_position.y > jugador_libre.global_position.y + 6:
			movimiento.y -= 90
		
		if global_position.y < jugador_libre.global_position.y - 6:
			movimiento.y += 90
		


func _on_movimiento_laterales_body_entered(body):
	if body.get_name() == "Player":
		jugador = body
	pass 


func _on_movimiento_laterales_body_exited(body):
	jugador = null
	pass 


func _on_movimoento_libre_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	
	pass # Replace with function body.


func _on_movimoento_libre_body_exited(body):
	jugador_libre = null
	pass # Replace with function body.
