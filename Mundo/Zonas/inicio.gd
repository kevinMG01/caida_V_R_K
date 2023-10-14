extends Node2D





var en_pantalla = 0

func _ready():
	en_pantalla = 0
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		en_pantalla += 1
	
	if en_pantalla == 1 :
		$AnimatedSprite.animation = "1"
		pass
	if en_pantalla == 2:
		$AnimatedSprite.animation = "2"
		pass
	if en_pantalla == 3:
		get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")

		pass

