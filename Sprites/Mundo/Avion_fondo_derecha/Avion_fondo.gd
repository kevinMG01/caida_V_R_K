extends KinematicBody2D


var movimiento = Vector2()
var velocity = 30
var cantidad = 800
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
	if comenzar_area == true:
		move()
	movimiento = move_and_slide(movimiento)
	movimiento.x = lerp(movimiento.x,0,0.21)
	
	
	#if comenzar_rot == true:
	#	get_node("CollisionShape2D").rotate(speed)
	#if comenzar_rot == true:
	#	get_node("Sprite").rotate(speed)
	#pass

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



#func _on_Area2D_body_entered(body):
#	if body.get_name() == "Player_l":
#		global_Var.vida -= 1
#		global_Var.cantidad = 0
#		body.queue_free()
#	if body.get_name() == "Player_ll":
#		global_Var.vida -= 1
#		global_Var.cantidad_j_2 = 0
#		body.queue_free()


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		comenzar_area = true
		pass
