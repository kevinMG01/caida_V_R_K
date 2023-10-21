extends Node2D





var en_pantalla = 1

func _ready():
	en_pantalla = 1
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		en_pantalla += 1
	
	if en_pantalla == 1 :
		$AnimatedSprite.animation = "1"
		pass
	if en_pantalla == 2:
		#get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/new_nivel_1/New_nivel_1.tscn")

		##pass



func _on_enter_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/new_nivel_1/New_nivel_1.tscn")
	pass # Replace with function body.
