extends Control




func _on_jugar_pressed():
	get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass 


func _on_Salir_pressed():
	get_tree().quit()
	pass 


func _on_Button3_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")
	pass 


func _on_Tienda_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")
	pass 


func _on_Inventario_pressed():
	get_tree().change_scene("")
	pass 


func _on_Biografia_pressed():
	get_tree().change_scene("res://Menu/Controles/Biografia.tscn")
	
	pass 







