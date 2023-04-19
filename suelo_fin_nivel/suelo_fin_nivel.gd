
extends Area2D



func _ready():
	pass 


func _on_suelo_fin_nivel_body_entered(body):
	if body.get_name() == "Player":
		global_Var.nivel += 1
		global_Var.deteccion_enemigo = true
		if global_Var.nivel == 2:
			get_tree().change_scene("res://Nivel_2/Nivel_2.tscn")
		if global_Var.nivel == 3:
	#	get_tree().change_scene("")
	#	global_Var.tiempo = 50
	#	global_Var.puntos_player_1 = 0
	#	global_Var.vida = 5
			pass
