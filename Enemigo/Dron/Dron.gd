extends KinematicBody2D


var movimiento = Vector2()
var velocity = 110
var cantidad = 152

var jugador_libre = null
var spawn = false

var temporizador_actual = 1
var temporizador_comparativa = 1
var bomba = preload("res://Enemigo/Dron/bomba/bomba_dron.tscn")
var spaw_bonba = true
var preguntar = false

func _ready():
	$AnimatedSprite.playing = true
	$expancion.visible = false
	$expancion.playing = false

func _physics_process(delta):
	if global_Var.detener_dron == false:
		movimiento = Vector2()
		move()
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
		$expancion.visible = true
		$expancion.playing = true

	pass


func spawn_bomba():
	if spaw_bonba == true:
		var newbomba = bomba.instance()
		add_child(newbomba)
		newbomba.global_position = get_tree().get_nodes_in_group("1")[0].global_position
		temporizador_actual += 1
		preguntar = true
		spaw_bonba = false
		


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		jugador_libre = body
	pass # Replace with function body.
