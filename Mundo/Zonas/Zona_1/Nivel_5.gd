extends Node2D

var spawn_dron = false
var dron = preload("res://Enemigo/Dron/Dron.tscn")
var posicion_dron = 0


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
			spawn_dron = false
		elif posicion_dron == 2:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_2")[0].global_position
			spawn_dron = false
		elif posicion_dron == 3:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_3")[0].global_position
			spawn_dron = false
		elif posicion_dron == 4:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_4")[0].global_position
			spawn_dron = false
			
		elif posicion_dron == 5:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_5")[0].global_position
			spawn_dron = false
		elif posicion_dron == 6:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_6")[0].global_position
			
			var newdron_2 = dron.instance()
			add_child(newdron_2)
			newdron_2.global_position = get_tree().get_nodes_in_group("dron_6_2")[0].global_position
			spawn_dron = false
		elif posicion_dron == 7:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_7")[0].global_position
			spawn_dron = false
		elif posicion_dron == 8:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_8")[0].global_position
			spawn_dron = false
		elif posicion_dron == 9:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_9")[0].global_position
			spawn_dron = false
		
			var newdron_2 = dron.instance()
			add_child(newdron_2)
			newdron_2.global_position = get_tree().get_nodes_in_group("dron_9_2")[0].global_position
			spawn_dron = false
		elif posicion_dron == 10:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_10")[0].global_position
			spawn_dron = false
		elif posicion_dron == 11:
			var newdron = dron.instance()
			add_child(newdron)
			newdron.global_position = get_tree().get_nodes_in_group("dron_11")[0].global_position
			
			var newdron_2 = dron.instance()
			add_child(newdron_2)
			newdron_2.global_position = get_tree().get_nodes_in_group("dron_11_2")[0].global_position
			
			var newdron_3 = dron.instance()
			add_child(newdron_3)
			newdron_3.global_position = get_tree().get_nodes_in_group("dron_11_3")[0].global_position
			spawn_dron = false
		



func _on_deteccion_dron_1_body_entered(body):
	if body.get_name() == "Player":
		spawn_dron = true
		posicion_dron += 1 
		
		
	pass # Replace with function body.


func _on_deteccion_dron_1_body_exited(body):
	spawn_dron = false
	pass # Replace with function body.
