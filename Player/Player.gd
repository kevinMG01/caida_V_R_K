extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()


var gravedad = 70
var masa = 2
var salto = 100

var tiene_paracaida = true 
var esta_suelo = false


var colicion_enemigo = false

#///////////////
var normalizar = false
#\\\\\\\\\\\\\\\\
func _ready():
	$AnimatedSprite.playing = true
	colicion_enemigo = true
	get_tree().paused = false
	
func _physics_process(delta):
	comienzo()
	if colicion_enemigo == false:
		move_con_paracaidas()
		power_up()
		movimiento = move_and_slide(movimiento, Vector2(0, -1))
		
		if esta_suelo == false:
			movimiento.y = gravedad * masa
		elif esta_suelo == true:
			movimiento.y = movimiento.y + gravedad * delta
	#movimiento = movimiento.normalized()* cantidad
	
	pass

func comienzo():
	if normalizar == false:
		if global_Var.camara_avion_apagado == true:
			colicion_enemigo = true
		if global_Var.camara_avion_apagado == false:
			colicion_enemigo = false
			normalizar = true

func move_con_paracaidas():
	if !is_on_floor():
		if Input.is_action_just_pressed("ui_down"):
			 tiene_paracaida = !tiene_paracaida
			
	if is_on_floor():
		esta_suelo = true
		
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = -salto
	
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
			
		if Input.is_action_pressed("ui_left"):
			movimiento.x -= cantidad
			$AnimatedSprite.flip_h = true
			
		if Input.is_action_pressed("ui_right"):
			movimiento.x += cantidad
			$AnimatedSprite.flip_h = false
			
		if movimiento.x == 0:
				$AnimatedSprite.animation = "Idle_suelo"
		if !is_on_floor():
			$AnimatedSprite.animation = "Up"
		pass




func power_up():
	if Input.is_action_just_pressed("1"):
		if global_Var.power_up > 0:
			cantidad = 300
			global_Var.power_up -= 1
			yield(get_tree().create_timer(1,5),"timeout")
			cantidad = 150
	pass


#if body.is_in_group("enemigo"):
#		self.queue_free()


func _on_detectar_enemigos_body_entered(body):
	if body.is_in_group("enemigo"):
		colicion_enemigo = true
		global_Var.pausa = true
		get_tree().paused = true
		global_Var.deteccion_enemigo = true
		pass
	pass # Replace with function body.
