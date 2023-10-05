extends Node2D

var spawn_dron = false
var dron = preload("res://Enemigo/Dron/Dron.tscn")
var posicion_dron = 0

var bomba = preload("res://Enemigo/Dron/bomba/bomba_dron.tscn")
var bomba_nivel_activo = false
var spaws_bomba = true
var bomba_congelar = preload("res://Enemigo/Dron/bomba/bomba_congelar/Bomba_congelar.tscn")

var contador_bombas = 0

func _ready():
	posicion_dron = 0 
	global_Var.camara_avion_apagado = true
	global_Var.nivel = 5

func _physics_process(delta):
	player()
	spawn_dron()
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
			newbomba.global_position = get_tree().get_nodes_in_group("Bomba_relentizar")[0].global_position

func spawn_bombas_congelar(): # para no vorar ajajajajaj
	if bomba_nivel_activo == true:
		if spaws_bomba == true:
			var newbomba = bomba_congelar.instance()
			add_child(newbomba)
			newbomba.global_position = get_tree().get_nodes_in_group("bomba_congelar")[0].global_position


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
	spawn_bombas()
	pass


func _on_relentizar_timeout(): # jajajajajajaj era congelar
	spawn_bombas_congelar()
	pass 
