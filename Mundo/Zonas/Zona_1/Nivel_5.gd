extends Node2D

var spawn_dron = false
var dron = preload("res://Enemigo/Dron/Dron.tscn")
var posicion_dron = 0

var bomba = preload("res://Enemigo/Dron/bomba/bomba_dron.tscn")
var bomba_nivel_activo = false
var spaws_bomba = true
var bomba_congelar = preload("res://Enemigo/Dron/bomba/bomba_congelar/Bomba_congelar.tscn")

var contador_bombas = 0

#/////////////////////////////////////////////////////////////////////////////////////////
var posicion_bombas = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]

var posicion_actual_comgelar = []
var posicion_actual_relentizar = []

var bloquear_salida_congelar = true
var bloquear_salida_relentizar = true

#//////////////////////////////////////////////////////////////////////////////////////////
func _ready():
	randomize()
	global_Var.detener_dron = false
	posicion_dron = 0 
	global_Var.camara_avion_apagado = true
	global_Var.nivel = 5

func _physics_process(delta):
	player()
	spawn_dron()
	posicion_bombas_congelar()
	bloquear_meta()
	pass

func player():
	if global_Var.camara_avion_apagado == true:
		$avion/Player.visible = false
	elif global_Var.camara_avion_apagado == false:
		$avion/Player.visible = true

func _on_Detener_enemigo_body_entered(body):
	if body.is_in_group("enemigo"):
		global_Var.deteccion_enemigo = false

func bloquear_meta():
	if global_Var.niveles_desbloqueados >= 5:
		$meta/ir_zona_seleccion.visible = true
		$meta/primera_ves.visible = false
	pass

func spawn_dron():
	if spawn_dron == true:
		if posicion_dron == 1:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_1")[0].global_position
			bomba_nivel_activo = true
			spawn_dron = false

func spawn_bombas(): # para no vorar ajajajajaj
	if bomba_nivel_activo == true:
		if spaws_bomba == true:
			var newbomba = bomba.instance()
			add_child(newbomba)
			newbomba.global_position = get_tree().get_nodes_in_group(posicion_actual_relentizar[0])[0].global_position

			var newbomba2 = bomba.instance()
			add_child(newbomba2)
			newbomba2.global_position = get_tree().get_nodes_in_group(posicion_actual_relentizar[1])[0].global_position

func spawn_bombas_congelar(): # para no vorar ajajajajaj
	if bomba_nivel_activo == true:
		if spaws_bomba == true:
			var newbomba = bomba_congelar.instance()
			add_child(newbomba)
			newbomba.global_position = get_tree().get_nodes_in_group(posicion_actual_comgelar[0])[0].global_position
			
			var newbomba2 = bomba_congelar.instance()
			add_child(newbomba2)
			newbomba2.global_position = get_tree().get_nodes_in_group(posicion_actual_comgelar[1])[0].global_position

func _on_deteccion_dron_1_body_entered(body):
	if body.get_name() == "Player":
		spawn_dron = true
		posicion_dron += 1 
		$Timer.start()
		$relentizar.start()
	pass 

func _on_deteccion_dron_1_body_exited(body):
	spawn_dron = false
	pass 

func _on_Timer_timeout():
	bloquear_salida_relentizar = true
	posicion_bombas_relentizar()
	pass

func _on_relentizar_timeout(): # jajajajajajaj era congelar
	bloquear_salida_congelar = true
	posicion_bombas_congelar()
#	spawn_bombas_congelar()
	pass 

func _on_Area2D_body_entered(body):
	if body.get_name() == "Dron":
		global_Var.detener_dron = true
	pass 

func _on_tocar_suelo_body_entered(body):
	if body.get_name() == "Player":
		global_Var.nivel = 4
	pass 


func posicion_bombas_congelar():
	if bloquear_salida_congelar == true:
		while posicion_actual_comgelar.size() < 2:
			var sacar_numero = int(rand_range(0, 14))  

			var numero = posicion_bombas[sacar_numero]
	
			var new_posicion_actual = String(numero)
			if not posicion_actual_comgelar.has(new_posicion_actual):
				posicion_actual_comgelar.append(new_posicion_actual)
		spawn_bombas_congelar()
		posicion_actual_comgelar = []
		bloquear_salida_congelar = false
	pass


func posicion_bombas_relentizar():
	if bloquear_salida_relentizar == true:
		while posicion_actual_relentizar.size() < 2:
			var sacar_numero = int(rand_range(0, 14))  

			var numero = posicion_bombas[sacar_numero]
	
			var new_posicion_actual = String(numero)
			if not posicion_actual_relentizar.has(new_posicion_actual):
				posicion_actual_relentizar.append(new_posicion_actual)
		spawn_bombas()
		posicion_actual_relentizar = []
		bloquear_salida_relentizar = false
	pass




