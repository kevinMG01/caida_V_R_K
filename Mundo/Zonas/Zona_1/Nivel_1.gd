extends Node2D


var cartel_reintentar = preload("res://Menu/muerte/reintentar_2.tscn")
var muerte = false
func muertte():
	if muerte == true:
		var newcartel = cartel_reintentar.instance()
		add_child(newcartel)
		newcartel.global_position = get_tree().get_nodes_in_group("")[0].global_position
	pass

func _ready():
	global_Var.camara_avion_apagado = true
	global_Var.nivel = 1
	

func _physics_process(delta):
	bloquear_meta()
	player()
	pass

func player():
	if global_Var.camara_avion_apagado == true:
		$avion/Player.visible = false
	elif global_Var.camara_avion_apagado == false:
		$avion/Player.visible = true
	pass

func _on_Detener_enemigo_body_entered(body):
	if body.is_in_group("enemigo"):
		global_Var.deteccion_enemigo = false
	pass

func bloquear_meta():
	if global_Var.niveles_desbloqueados >= 2:
		$meta/ir_zona_seleccion.visible = true
		$meta/primera_ves.visible = false
	pass
