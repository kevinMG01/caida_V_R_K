extends KinematicBody2D


var movimiento = Vector2()
var velocity = 130

var jugador = null

func _ready():
	
	pass

func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento)
	pass

func move():
	if jugador != null:
		if global_position.x > jugador.global_position.x + 6:
			movimiento.x -= velocity
			$AnimatedSprite.flip_h = true
		if global_position.x < jugador.global_position.x - 6:
			movimiento.x += velocity
			$AnimatedSprite.flip_h = false
		if global_position.y > jugador.global_position.y + 6:
			movimiento.y -= velocity
		if global_position.y < jugador.global_position.y - 6:
			movimiento.y += velocity
	pass
	
func invocar():
	
	pass
