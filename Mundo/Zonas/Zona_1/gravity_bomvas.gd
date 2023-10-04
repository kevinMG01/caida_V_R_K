extends KinematicBody2D


var movimiento = Vector2()
var gravity = 55
var maza = 2

func _process(delta):
	yield(get_tree().create_timer(20,0),"timeout")
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
	movimiento.y = gravity * maza
