extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()

#powuer up
var vel_power = 280

var gravedad = 5
var masa = 2
	
func _physics_process(delta):
	movimiento = move_and_slide(movimiento)
	movimiento.y += gravedad 
	pass




