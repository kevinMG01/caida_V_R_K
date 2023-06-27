extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()


var gravedad = 70
var masa = 2

var tiene_paracaida = true
	
	
func _physics_process(delta):
	move_con_paracaidas()
	power_up()
	movimiento = move_and_slide(movimiento)
	movimiento.y = gravedad * masa
	#movimiento = movimiento.normalized()* cantidad
	
#	var minimo = get_tree().get_nodes_in_group("min")[0].global_position
#	var maximo = get_tree().get_nodes_in_group("max")[0].global_position
#	
#	if (global_position.x < minimo.x):
#		global_position.x = minimo.x +5
#	elif (global_position.x > minimo.x):
#		global_position.x = maximo.x -5
	
#	if (global_position.y > maximo.y):
#		global_position.y = maximo.y +5
#	elif (global_position.y < minimo.y):
#		global_position.y = minimo.y -5
	
	
	pass



func move_con_paracaidas():
	if !is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			 tiene_paracaida = !tiene_paracaida

	if tiene_paracaida == true:
		cantidad = 150
		gravedad = 70
		movimiento.x = 0
		if Input.is_action_pressed("ui_left"):
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
		elif Input.is_action_pressed("ui_right"):
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false

	elif tiene_paracaida == false:
		cantidad = 70
		gravedad = 150
		movimiento.x = 0
		if Input.is_action_pressed("ui_left"):
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
		if Input.is_action_pressed("ui_right"):
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false




func power_up():
	if Input.is_action_just_pressed("ui_accept"):
		if global_Var.power_up > 0:
			cantidad = 300
			global_Var.power_up -= 1
			yield(get_tree().create_timer(1,5),"timeout")
			cantidad = 150
	pass


func _on_colicion_muerte_body_entered(body):
#	if body.get_name() == "Enemigo":
#		body.queue_free()
	pass # Replace with function body.
