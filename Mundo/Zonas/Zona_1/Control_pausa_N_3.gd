extends Node2D



func _physics_process(delta):
	camara_nivel_3()


func camara_nivel_3():
	if global_Var.camara_avion_apagado == true:
		if global_Var.pausa == false:
			$Camera2D.drag_margin_h_enabled = true
			$Camera2D.drag_margin_v_enabled = true
			$Camera2D.global_position = get_tree().get_nodes_in_group("avion")[0].global_position
		if global_Var.pausa == true:
			$Camera2D.drag_margin_h_enabled = false
			$Camera2D.drag_margin_v_enabled = false
			$Camera2D.global_position = get_tree().get_nodes_in_group("pausa")[0].global_position
	elif global_Var.camara_avion_apagado == false:
		if global_Var.pausa == false:
			$Camera2D.drag_margin_h_enabled = true
			$Camera2D.drag_margin_v_enabled = true
			$Camera2D.global_position = get_tree().get_nodes_in_group("player")[0].global_position
		if global_Var.pausa == true:
			$Camera2D.drag_margin_h_enabled = false
			$Camera2D.drag_margin_v_enabled = false
			$Camera2D.global_position = get_tree().get_nodes_in_group("pausa")[0].global_position

