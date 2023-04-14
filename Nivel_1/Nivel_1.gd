extends Node2D

var spawn_1 = true
var player_1 = preload("res://Player/Player.tscn")

func spawn_player():
	if spawn_1 == true:
		var newplayer = player_1.instance()
		add_child(newplayer)
		newplayer.global_position = get_tree().get_nodes_in_group("spawn_1")[0].global_position
		spawn_1 = false
		#if global_Var.comensar:
		#	spawn_1 = true
		#	global_Var.cantidad = 1
