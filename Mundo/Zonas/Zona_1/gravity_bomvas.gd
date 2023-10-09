extends KinematicBody2D


var movimiento = Vector2()
var gravity = 55
var maza = 2

func _process(delta):
	#if global_Var.detener_dron == false:
	#	yield(get_tree().create_timer(20,0),"timeout")
	#	move()
	#	movimiento = move_and_slide(movimiento, Vector2(0, -1))
	#	movimiento.y = gravity * maza
	pass



func move():
	if global_Var.tocar_bombas == 1:
		gravity = 55
	if global_Var.tocar_bombas == 2:
		gravity = 29
	if global_Var.tocar_bombas == 3:
		gravity = 0
	pass
