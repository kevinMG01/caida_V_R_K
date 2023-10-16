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

var bomba_congelante = false
var bomba_relentizante = false

func _ready():
	$AnimatedSprite.playing = true
	colicion_enemigo = true
	get_tree().paused = false
	
func _physics_process(delta):
	comienzo()
	if colicion_enemigo == false:
		move_con_paracaidas()
		movimiento = move_and_slide(movimiento, Vector2(0, -1))
		if global_Var.nivel == 5:
			if esta_suelo == false:
				movimiento.y = gravedad * masa
			elif esta_suelo == true:
				movimiento.y = gravedad * masa
		elif global_Var.nivel < 5:
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
		if global_Var.nivel < 5:
			if Input.is_action_just_pressed("ui_down"):
				tiene_paracaida = !tiene_paracaida
			
	if is_on_floor():
		esta_suelo = true
		
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = -salto
	
	if esta_suelo == false:
		if global_Var.nivel < 5:
			if tiene_paracaida == true:
				cantidad = 150
				gravedad = 70
				movimiento.x = 0
				$AudioStreamPlayer.play()
				
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
				$AudioStreamPlayer.autoplay = false
				$AnimatedSprite.animation = "Move_paracaida"
				if Input.is_action_pressed("ui_left"):
					movimiento.x -= cantidad
					$AnimatedSprite.flip_h = true
				elif Input.is_action_pressed("ui_right"):
					movimiento.x += cantidad
					$AnimatedSprite.flip_h = false
		elif global_Var.nivel == 5:
			if tiene_paracaida == true:
				cantidad = 150
				gravedad = 55
				movimiento.x = 0
				tocar_bombas()
				$AnimatedSprite.animation = "Move_paracaida"
				if Input.is_action_pressed("ui_left"):
					movimiento.x -= cantidad
					$AnimatedSprite.flip_h = true
				elif Input.is_action_pressed("ui_right"):
					movimiento.x += cantidad
					$AnimatedSprite.flip_h = false
				
	elif esta_suelo == true:
		$AudioStreamPlayer.stop()
		if global_Var.nivel < 5:
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
		elif global_Var.nivel == 5:
			if tiene_paracaida == true:
				cantidad = 150
				gravedad = 55
				movimiento.x = 0
				tocar_bombas()
				$AnimatedSprite.animation = "Move_paracaida"
				if Input.is_action_pressed("ui_left"):
					movimiento.x -= cantidad
					$AnimatedSprite.flip_h = true
				elif Input.is_action_pressed("ui_right"):
					movimiento.x += cantidad
					$AnimatedSprite.flip_h = false
		pass



func tocar_bombas(): # como me equiboque ahora puse los efectos al reves para no tener que escrivir mas
	if bomba_relentizante == true:     # congelar
		cantidad = 0
		gravedad = 0
		movimiento.x = 0
	if bomba_congelante == true:     # relentizar
		cantidad = 150
		gravedad = 35
		movimiento.x = 0
		
	pass



func _on_detectar_enemigos_body_entered(body):
	if body.is_in_group("enemigo"):
		colicion_enemigo = true
		global_Var.pausa = true
		get_tree().paused = true
		global_Var.deteccion_enemigo = true
		pass
	pass # Replace with function body.


func _on_deteccion_bombas_area_entered(area):
	if area.is_in_group("bom_relentizar"):
		bomba_relentizante = true
		global_Var.tocar_bombas = 2
		yield(get_tree().create_timer(1,0),"timeout")
		global_Var.tocar_bombas = 1
		bomba_relentizante = false
	elif area.is_in_group("bom_congelar"):
		bomba_congelante = true
		global_Var.tocar_bombas = 3
		yield(get_tree().create_timer(1,0),"timeout")
		global_Var.tocar_bombas = 1
		bomba_congelante = false
	pass



func _on_detectar_enemigos_area_entered(area):
	if area.is_in_group("obtacuo_niv_4"):
		global_Var.nivel = 5
		print("hola_soy yo")
	if area.is_in_group("enemigo"):
		colicion_enemigo = true
		global_Var.pausa = true
		get_tree().paused = true
		global_Var.deteccion_enemigo = true
	pass # Replace with function body.


func _on_nivel_4_coli_nuves_body_entered(body):
	if body.is_in_group("obtacuo_niv_4"):
		global_Var.nivel = 5
	pass # Replace with function body.


func _on_nivel_4_coli_nuves_body_exited(body):
	if body.is_in_group("obtacuo_niv_4"):
		esta_suelo = false
		global_Var.nivel = 4
	pass # Replace with function body.



func _on_collicion_suelo_body_entered(body):
	if global_Var.nivel < 5:
		if tiene_paracaida == false:
			colicion_enemigo = true
			global_Var.pausa = true
			get_tree().paused = true
			global_Var.deteccion_enemigo = true
	pass # Replace with function body.