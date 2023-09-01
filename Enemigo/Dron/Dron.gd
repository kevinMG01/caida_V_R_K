extends KinematicBody2D


var movimiento = Vector2()
var velocity = 120
var cantidad = 150

var jugador_libre = null
var spawn = false


var trece_bombas = ["1", "2","3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
var posicion_trece_bombas = 7
var bomba = preload("res://Enemigo/Dron/bomba/bomba_dron.tscn")
var contador_bombas = trece_bombas[posicion_trece_bombas]
var spawn_bombas_masiva = false

func _ready():
	$AnimatedSprite.playing = true
	velocity = 120
	$expancion.visible = false
	$expancion.playing = false

func _physics_process(delta):
	movimiento = Vector2()
	move()
	if spawn_bombas_masiva == true:
		spawn_bomba()
	movimiento = move_and_slide(movimiento)
	pass


func move():
	if jugador_libre != null:
		if global_position.x > jugador_libre.global_position.x + 6:
			movimiento.x -= cantidad

		if global_position.x < jugador_libre.global_position.x - 6:
			movimiento.x += cantidad
		if global_position.y > jugador_libre.global_position.y + 6:
			movimiento.y -= velocity
		
		if global_position.y < jugador_libre.global_position.y - 6:
			movimiento.y += velocity
		yield(get_tree().create_timer(4,0),"timeout")
		cantidad = 20
		velocity = 30
		$expancion.visible = true
		$expancion.playing = true
		spawn_bombas_masiva = true
		yield(get_tree().create_timer(0,2),"timeout")
		spawn_bombas_masiva = false
		yield(get_tree().create_timer(8,0),"timeout")
		queue_free()
	pass

func spawn_bomba():
	if spawn_bombas_masiva == true:
		var newbomba = bomba.instance()
		add_child(newbomba)
		newbomba.global_position = get_tree().get_nodes_in_group("1")[0].global_position
		
		var newbomba_2 = bomba.instance()
		add_child(newbomba_2)
		newbomba_2.global_position = get_tree().get_nodes_in_group("2")[0].global_position
		
		var newbomba_3 = bomba.instance()
		add_child(newbomba_3)
		newbomba_3.global_position = get_tree().get_nodes_in_group("3")[0].global_position
		
		var newbomba_4 = bomba.instance()
		add_child(newbomba_4)
		newbomba_4.global_position = get_tree().get_nodes_in_group("4")[0].global_position
		
		var newbomba_5 = bomba.instance()
		add_child(newbomba_5)
		newbomba_5.global_position = get_tree().get_nodes_in_group("5")[0].global_position
		
		var newbomba_6 = bomba.instance()
		add_child(newbomba_6)
		newbomba_6.global_position = get_tree().get_nodes_in_group("6")[0].global_position
		
		var newbomba_7 = bomba.instance()
		add_child(newbomba_7)
		newbomba_7.global_position = get_tree().get_nodes_in_group("7")[0].global_position
		
		var newbomba_8 = bomba.instance()
		add_child(newbomba_8)
		newbomba_8.global_position = get_tree().get_nodes_in_group("8")[0].global_position
		
		var newbomba_9 = bomba.instance()
		add_child(newbomba_9)
		newbomba_9.global_position = get_tree().get_nodes_in_group("9")[0].global_position
		
		var newbomba_10 = bomba.instance()
		add_child(newbomba_10)
		newbomba_10.global_position = get_tree().get_nodes_in_group("10")[0].global_position
		
		var newbomba_11 = bomba.instance()
		add_child(newbomba_11)
		newbomba_11.global_position = get_tree().get_nodes_in_group("11")[0].global_position
		
		var newbomba_12 = bomba.instance()
		add_child(newbomba_12)
		newbomba_12.global_position = get_tree().get_nodes_in_group("12")[0].global_position
		
		var newbomba_13 = bomba.instance()
		add_child(newbomba_13)
		newbomba_13.global_position = get_tree().get_nodes_in_group("13")[0].global_position
		spawn_bombas_masiva = false

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		jugador_libre = body
	pass # Replace with function body.
