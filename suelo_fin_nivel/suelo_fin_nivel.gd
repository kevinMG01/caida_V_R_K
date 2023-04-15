
extends Area2D



func _ready():
	pass 


func _on_suelo_fin_nivel_body_entered(body):
	global_Var.nivel += 1
	
