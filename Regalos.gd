extends Node



var movimiento = Vector2()
var velocity = 30
var cantidad = 400
var comensar = false
var caminar = false


var gravedad = 100
var masa = 1

func _ready():
	comensar = true
	pass 


func _physics_process(delta):
	move()
	movimiento.y = gravedad * masa
	pass

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
