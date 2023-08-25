extends Control


func _ready():
	$pausa.visible = false
	pass # Replace with function body.




func _input(event: InputEvent):
	if global_Var.deteccion_enemigo == false:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().paused = not get_tree().paused #"not" para que se intercambie, si es verdadera se va a poner en falso y si es en falso se va a poner en verdadero
	elif global_Var.deteccion_enemigo == true:
		yield(get_tree().create_timer(0.2),"timeout")
		$pausa.visible = true

	if get_tree().paused == true:
		global_Var.pausa = true
		$pausa.visible = true
	elif get_tree().paused == false:
		global_Var.pausa = false
		$pausa.visible = false
		global_Var.pausa = false


func _on_Reintentar_1_pressed():
	get_tree().paused = false
	if global_Var.nivel == 1:
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")
	if global_Var.nivel == 2:
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_2.tscn")
	if global_Var.nivel == 3:
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_3.tscn")
	if global_Var.nivel == 4:
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_4.tscn")
	if global_Var.nivel == 5:
		get_tree().change_scene("")
	global_Var.deteccion_enemigo = false
	pass

func _on_Tienda_1_pressed():
	get_tree().change_scene("")
	pass

func _on_Inventario_1_pressed():
	get_tree().change_scene("")
	pass 

func _on_Salir_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Menu/Menu/Menu.tscn")
	global_Var.deteccion_enemigo = false
	pass 
