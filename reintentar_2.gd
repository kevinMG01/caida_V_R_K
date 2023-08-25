extends Control

func _ready():
	visible = false

func _process(delta):
	if global_Var.deteccion_enemigo == true:
		visible = true

func _on_reintentar_pressed():
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
	visible = false
	pass # Replace with function body.


func _on_inventario_pressed():
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().paused = false
	global_Var.deteccion_enemigo = false
	get_tree().change_scene("res://Menu/Menu/Menu.tscn")
	pass # Replace with function body.
