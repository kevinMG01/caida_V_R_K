
extends Area2D



func _ready():
	pass 


func _on_suelo_fin_nivel_body_entered(body):
	if body.get_name() == "Player":
		global_Var.nivel += 1
		global_Var.deteccion_enemigo = true
		if global_Var.nivel == 2:
			global_Var.camara_avion_apagado = true
			yield(get_tree().create_timer(1, 5),"timeout")
			get_tree().change_scene("res://Nivel_2/Nivel_2.tscn")
		if global_Var.nivel == 3:
			global_Var.camara_avion_apagado = true
			yield(get_tree().create_timer(1, 5),"timeout")
			get_tree().change_scene("res://Nivel_3/Nivel_3.tscn")
		if global_Var.nivel == 4:
			global_Var.camara_avion_apagado = true
			yield(get_tree().create_timer(1, 5),"timeout")
			get_tree().change_scene("res://Nivel_4/Nivel_4.tscn")

