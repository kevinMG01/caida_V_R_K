extends KinematicBody2D


var movimiento = Vector2()
var velocity = 120

var jugador_libre = null
var spawn = false

#var trece_bombas = ["1", "2","3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
#var posicion_trece_bombas = 0
#var bomba = preload("res://Enemigo/Dron/bomba/bomba_dron.tscn")
#var contador_bombas = trece_bombas[posicion_trece_bombas]

func _ready():
	$AnimatedSprite.playing = true
	velocity = 120
	$expancion.visible = false
	$expancion.playing = false

func _physics_process(delta):
	movimiento = Vector2()
	move()
	spawn_bomba()
	movimiento = move_and_slide(movimiento)
	pass


func move():
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x + 6:
			movimiento.x -= 150

		if global_position.x < jugador_libre.global_position.x - 6:
			movimiento.x += 150
		if global_position.y > jugador_libre.global_position.y + 6:
			movimiento.y -= velocity
		
		if global_position.y < jugador_libre.global_position.y - 6:
			movimiento.y += velocity
		yield(get_tree().create_timer(4,0),"timeout")
		velocity = 30
		$expancion.visible = true
		$expancion.playing = true
		spawn = true
		yield(get_tree().create_timer(4,0),"timeout")
		queue_free()
	pass
	

#func spawn_bomba():
#	if spawn == true:
#		while posicion_trece_bombas < 13:
#			var newbomba = bomba.instance()
#			add_child(newbomba)
#			newbomba.global_position = get_tree().get_nodes_in_group(contador_bombas)[0].global_position
#			posicion_trece_bombas += 1 
#		spawn = false
#		posicion_trece_bombas = 0
		



func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	pass # Replace with function body.
