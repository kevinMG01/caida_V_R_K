extends KinematicBody2D


var movimiento = Vector2()
var velocity = 20

var cantidad = 900

var distancia = 200
var comensar = false
var caminar = false

var comenzar_area = false

func _ready():
	$AnimatedSprite.animation = "Idle"
	comensar = true
	pass 

func _physics_process(delta):
	move()
	movimiento = move_and_slide(movimiento)
	movimiento.x = lerp(movimiento.x,0,0.21)

func move():
#	var cantidad = 5
	if comensar == true:
		movimiento.x += velocity
		cantidad -= 1
		if cantidad <= 150:
			$AnimatedSprite.playing = true
			$AnimatedSprite.animation = "move"
			yield(get_tree().create_timer(1.0),"timeout")
			$AnimatedSprite.animation = "caida"
			yield(get_tree().create_timer(1.0),"timeout")
			global_Var.camara_avion_apagado = false
			yield(get_tree().create_timer(7.0),"timeout")
			if cantidad <= 0:
				self.queue_free()
	pass
