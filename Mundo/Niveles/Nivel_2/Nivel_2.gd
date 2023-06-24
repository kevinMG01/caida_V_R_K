extends Node2D

var spawn_1 = true
var player_1 = preload("res://Player/Player.tscn")


func _physics_process(delta):
	spawn_player()
	
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


