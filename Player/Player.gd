extends KinematicBody2D


var cantidad = 150
var movimiento = Vector2()

#powuer up
var power_up = 0
var cant_pawer = 1
var vel_power = 280

var gravedad = 70
var masa = 2
	
func _physics_process(delta):
	if power_up == 0:
		move()
	if power_up == 1:
		move_pawer_up()
	if cant_pawer == 1:
		if Input.is_action_just_pressed("ui_accept"):
			power_up = 1
			yield(get_tree().create_timer(1,5),"timeout")
			power_up = 0
			cant_pawer = 0
		
		
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
	movimiento.x = 0
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= vel_power
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x += vel_power
