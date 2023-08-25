extends Node2D





func _ready():
	$animacion_meta.playing = true
	$animacion_meta2.playing = true
	$Animat_2.playing = true
	$Animat_3.playing = true
	$ir_zona_seleccion.visible = false
	$primera_ves.visible = true
	
	pass 


func _process(delta):
	if $ir_zona_seleccion.visible == false:
		$ir_zona_seleccion.global_position = get_tree().get_nodes_in_group("afuera")[0].global_position
	else:
		$ir_zona_seleccion.global_position = get_tree().get_nodes_in_group("adentro")[0].global_position
	if $primera_ves.visible == true:
		$primera_ves.global_position = get_tree().get_nodes_in_group("adentro")[0].global_position
	else:
		$primera_ves.global_position = get_tree().get_nodes_in_group("afuera")[0].global_position
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


