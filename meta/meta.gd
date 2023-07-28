extends Node2D





func _ready():
	$animacion_meta.playing = true
	$ir_zona_seleccion.visible = false
	$primera_ves.visible = true
	pass 

func _process(delta):
	if $ir_zona_seleccion.visible == true:
		print("ir zona seleccion")
	if $primera_ves.visible== true:
		print("primera ves")
	pass



func _on_ir_zona_seleccion_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass 



func _on_primera_ves_body_entered(body):
	if body.get_name() == "Player":
		global_Var.niveles_desbloqueados += 1
		get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass


