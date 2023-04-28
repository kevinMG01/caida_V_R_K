extends KinematicBody2D


var movimiento = Vector2()
var velocity = 30
var cantidad = 400
var comensar = false
var caminar = false

var spawn_1 = true
var player_1 = preload("res://Enemigo/Enemigo_Santa_Claus/Regalos/Regalos.tscn")

var spawn_tiempo = false

var gravedad = 70
var masa = 2


func _ready():
	comensar = true
	pass 


func _physics_process(delta):
	spawn()
	move()
	movimiento.y = gravedad * masa
	movimiento = move_and_slide(movimiento)
	movimiento.x = lerp(movimiento.x,0,0.21)
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
			if cantidad == 400:
				caminar = false
			pass


func spawn():
	if spawn_tiempo == true:
		if spawn_1 == true:
			var newplayer = player_1.instance()
			add_child(newplayer)
			newplayer.global_position = get_tree().get_nodes_in_group("spawn")[0].global_position
			#spawn_1 = false
			spawn_tiempo = false
		
	


func _on_Timer_timeout():
	spawn_tiempo = true
	pass # Replace with function body.
