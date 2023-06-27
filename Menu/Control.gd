extends Control



func _ready():
	pass 




func _on_TextureButton_pressed():
	#cuando sea presionado
	get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass 


func _on_salir_pressed():
	
	pass 


func _on_controles_pressed():
	get_tree().change_scene("res://Menu/Controles/Controles.tscn")
	pass 
