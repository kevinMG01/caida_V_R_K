extends Control


func _ready():
	$botones_inferiores/Biografia/biografia_menu.play()
	$botones_inferiores/Tienda/tienda_menu.play()
	$Salir/salir_menu.play()
	$animacion_avion/otro_avion.playing = true
	$animacion_avion/AnimatedSprite.playing = true

func _on_jugar_pressed():
	get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass 


func _on_Salir_pressed():
	get_tree().quit()
	pass 

func _on_Tienda_pressed():
	get_tree().change_scene("")
	pass 

func _on_Inventario_pressed():
	get_tree().change_scene("")
	pass 

func _on_Biografia_pressed():
	get_tree().change_scene("res://Menu/Controles/Biografia.tscn")
	
	pass 



func _on_re_spawn_body_entered(body):
	if body.is_in_group("avion"):
		$animacion_avion.position = get_tree().get_nodes_in_group("posicion_new")[0].global_position
	if body.is_in_group("nu_1"):
		$Nuves/nu_1.position = get_tree().get_nodes_in_group("pos_nu_1")[0].global_position
	if body.is_in_group("nu_2"):
		$Nuves/nu_2.position = get_tree().get_nodes_in_group("pos_nu_2")[0].global_position
	pass # Replace with function body.
