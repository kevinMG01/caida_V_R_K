extends KinematicBody2D

var movimiento = Vector2()
var velocidad = 15


func _physics_process(delta):
	movimiento.x = velocidad
	movimiento = move_and_slide(movimiento)
