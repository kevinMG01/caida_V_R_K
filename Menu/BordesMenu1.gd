extends Sprite


var movimiento = Vector2()
var velocity = 100
var comensar = false



func _ready():
	comensar = true


func _physics_process(delta):
	if comensar == true:
		movimiento.x += velocity
		comensar = false
	if comensar == false:
		movimiento.x -= velocity
	pass
