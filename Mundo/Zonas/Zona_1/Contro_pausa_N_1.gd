extends Node2D



func _physics_process(delta):
	if global_Var.pausa == true:
		print("ver")
	camara_nivel_1()


func camara_nivel_1():
	if global_Var.camara_avion_apagado == true:
		if global_Var.pausa == false:
			$Camera_nivel_1.drag_margin_h_enabled = true
			$Camera_nivel_1.drag_margin_v_enabled = true
			$Camera_nivel_1.global_position = get_tree().get_nodes_in_group("avion")[0].global_position
			yield(get_tree().create_timer(0.2),"timeout")
			$Camera_nivel_1.smoothing_speed = 5
		if global_Var.pausa == true:
			$Camera_nivel_1.smoothing_speed = 40
			$Camera_nivel_1.drag_margin_h_enabled = false
			$Camera_nivel_1.drag_margin_v_enabled = false
			$Camera_nivel_1.global_position = get_tree().get_nodes_in_group("pausa")[0].global_position
			
	elif global_Var.camara_avion_apagado == false:
		if global_Var.pausa == false:
			$Camera_nivel_1.drag_margin_h_enabled = true
			$Camera_nivel_1.drag_margin_v_enabled = true
			$Camera_nivel_1.global_position = get_tree().get_nodes_in_group("player")[0].global_position
			yield(get_tree().create_timer(0.2),"timeout")
			$Camera_nivel_1.smoothing_speed = 5
		if global_Var.pausa == true:
			$Camera_nivel_1.smoothing_speed = 40
			$Camera_nivel_1.drag_margin_h_enabled = false
			$Camera_nivel_1.drag_margin_v_enabled = false
			$Camera_nivel_1.global_position = get_tree().get_nodes_in_group("pausa")[0].global_position
			
