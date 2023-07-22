extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$animacion_meta.playing = true
	pass 



func _on_ir_zona_seleccion_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Mundo/Seleccion_Zona/seleccion_Zona.tscn")
	pass # Replace with function body.
