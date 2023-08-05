extends Node2D


func _ready():
	global_Var.camara_avion_apagado = true

func _physics_process(delta):
	bloquear_meta()
	player()
	pass

func player():
	if global_Var.camara_avion_apagado == true:
		$avion/Player.visible = false
	elif global_Var.camara_avion_apagado == false:
		$avion/Player.visible = true
	pass

func _on_Detener_enemigo_body_entered(body):
	if body.is_in_group("enemigo"):
		global_Var.deteccion_enemigo = false
	pass

func bloquear_meta():
	if global_Var.niveles_desbloqueados >= 2:
		$meta/ir_zona_seleccion.visible = true
		$meta/primera_ves.visible = false
	pass
