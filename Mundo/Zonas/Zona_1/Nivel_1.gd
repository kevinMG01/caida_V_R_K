extends Node2D


var spawn_1 = true
var player_1 = preload("res://Player/Player.tscn")

func _ready():
	global_Var.camara_avion_apagado = true

func _physics_process(delta):
	spawn_player()
	camara_nivel_1()
	pass
	

func spawn_player():
	if global_Var.camara_avion_apagado == false:
		if spawn_1 == true:
			var newplayer = player_1.instance()
			add_child(newplayer)
			newplayer.global_position = get_tree().get_nodes_in_group("spawn")[0].global_position
			spawn_1 = false

func _on_Detener_enemigo_body_entered(body):
	if body.is_in_group("enemigo"):
		global_Var.deteccion_enemigo = false

func camara_nivel_1():
	if global_Var.camara_avion_apagado == true:
		$Camera2D.global_position = get_tree().get_nodes_in_group("avion")[0].global_position
	elif global_Var.camara_avion_apagado == false:
		$Camera2D.global_position = get_tree().get_nodes_in_group("player")[0].global_position
		

