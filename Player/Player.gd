extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()

#powuer up
var vel_power = 280

var gravedad = 70
var masa = 2
	
func _physics_process(delta):
	move()
	power_up()
	movimiento = move_and_slide(movimiento)
	movimiento.y = gravedad * masa
	#movimiento = movimiento.normalized()* cantidad
	pass


func move():
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= cantidad
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		movimiento.x += cantidad
		$AnimatedSprite.flip_h = false
func move_pawer_up():
	cantidad = 290

func power_up():
	if Input.is_action_just_pressed("ui_accept"):
		if global_Var.power_up > 0:
			move_pawer_up()
			global_Var.power_up -= 1
			yield(get_tree().create_timer(1,5),"timeout")
			cantidad = 150
	pass


func _on_colicion_muerte_body_entered(body):
#	if body.get_name() == "Enemigo":
#		body.queue_free()
	pass # Replace with function body.
