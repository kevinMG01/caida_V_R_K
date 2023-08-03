extends Node2D



var primera_ves = true

func _ready():
	$animacion_meta.playing = true
	$ir_zona_seleccion.visible = false
	$primera_ves.visible = true
	pass 

func _process(delta):
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


