extends Node2D


func _ready():
	global_Var.camara_avion_apagado = true
	global_Var.nivel = 4


func _physics_process(delta):
	player()
	bloquear_meta()
	pass

func player():
	if global_Var.camara_avion_apagado == true:
		$avion/Player_2.visible = false
	elif global_Var.camara_avion_apagado == false:
		$avion/Player_2.visible = true

func _on_Detener_enemigo_body_entered(body):
	if body.is_in_group("enemigo"):
		global_Var.deteccion_enemigo = false



func bloquear_meta():
	if global_Var.niveles_desbloqueados >= 5:
		$meta/ir_zona_seleccion.visible = true
		$meta/primera_ves.visible = false
	pass


