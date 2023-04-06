extends KinematicBody2D


var cantidad = 90
var movimiento = Vector2()

var gravedad = 5

func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento)
	movimiento.y = movimiento.y + gravedad
	pass


func move():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= cantidad
	if Input.is_action_pressed("ui_right"):
		movimiento.x += cantidad
