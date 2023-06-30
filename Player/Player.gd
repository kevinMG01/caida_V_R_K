extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()


var gravedad = 70
var masa = 2
var salto = 100

var tiene_paracaida = true 
var esta_suelo = false


func _ready():
	$AnimatedSprite.playing = true
	
func _physics_process(delta):
	move_con_paracaidas()
	power_up()
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
	
	if esta_suelo == false:
		movimiento.y = gravedad * masa
	elif esta_suelo == true:
		movimiento.y = movimiento.y + gravedad * delta
	#movimiento = movimiento.normalized()* cantidad
	
	pass



func move_con_paracaidas():
	if !is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			 tiene_paracaida = !tiene_paracaida
			
	if is_on_floor():
		esta_suelo = true
	
	if esta_suelo == false:
		if tiene_paracaida == true:
			cantidad = 150
			gravedad = 70
			movimiento.x = 0
			$AnimatedSprite.animation = "Move_paracaida"
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
			$AnimatedSprite.animation = "Move_paracaida"
			if Input.is_action_pressed("ui_left"):
				movimiento.x -= cantidad
				$AnimatedSprite.flip_h = true
			elif Input.is_action_pressed("ui_right"):
				movimiento.x += cantidad
				$AnimatedSprite.flip_h = false
	elif esta_suelo == true:
		cantidad = 150
		gravedad = 70
		movimiento.x = 0
		$AnimatedSprite.animation = "Move_suelo"
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = -salto
			
		if Input.is_action_pressed("ui_left"):
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
			
		if Input.is_action_pressed("ui_right"):
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false
			
		if movimiento.x == 0:
			$AnimatedSprite.animation = "Idle_suelo"
		pass




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
