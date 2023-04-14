extends KinematicBody2D



var movimiento = Vector2()
var velocity = 30
var cantidad = 900
var distancia = 200
var comensar = false
var caminar = false

#rotacion
var speed = 0.08
var comenzar_area = false


func _ready():
	comensar = true
	
	
	pass 


func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento)
	movimiento.x = lerp(movimiento.x,0,0.21)
	


func move():
#	var cantidad = 5
	if comensar == true:
		
		if caminar == false:
			movimiento.x += velocity
			cantidad -= 1
			if cantidad == 0:
				caminar = true
		if caminar == true:
			movimiento.x -= velocity
			cantidad += 1
			if cantidad == 200:
				caminar = false
			pass
	
	pass
