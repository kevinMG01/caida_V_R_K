extends Control


func _ready():
	pass # Replace with function body.




func _input(event: InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = not get_tree().paused #"not" para que se intercambie, si es verdadera se va a poner en falso y si es en falso se va a poner en verdadero
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
