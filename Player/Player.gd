extends CharacterBody2D


var cantidad = 150
var movimiento = Vector2()


var gravedad = 70
var masa = 2
var salto = 100

var tiene_paracaida = true
var esta_en_suelo = false
	
func _physics_process(delta):
<<<<<<< Updated upstream
	move_con_paracaidas()
	power_up()
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
	
	if esta_en_suelo == false:
		movimiento.y = gravedad * masa
	elif esta_en_suelo == true:
		movimiento.y = movimiento.y + gravedad * delta
=======
	if power_up == 0:
		move()
	if power_up == 1:
		move_pawer_up()
	if cant_pawer == 1:
		if Input.is_action_just_pressed("ui_accept"):
			power_up = 1
			await get_tree().create_timer(1,5).timeout
			power_up = 0
			cant_pawer = 0
		
		
	set_velocity(movimiento)
	move_and_slide()
	movimiento = velocity
	movimiento.y = gravedad * masa
>>>>>>> Stashed changes
	#movimiento = movimiento.normalized()* cantidad
	
	pass


<<<<<<< Updated upstream

func move_con_paracaidas():
	if !is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			 tiene_paracaida = !tiene_paracaida
	if is_on_floor():
		esta_en_suelo = true
		tiene_paracaida = true
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = -salto
		pass

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
=======
func move():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= cantidad
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("ui_right"):
		movimiento.x += cantidad
		$AnimatedSprite2D.flip_h = false
func move_pawer_up():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= vel_power
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x += vel_power
>>>>>>> Stashed changes
