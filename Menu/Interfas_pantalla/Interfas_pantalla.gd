extends Control


func _ready():
	$pausa.visible = false
	pass # Replace with function body.




func _input(event: InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = not get_tree().paused #"not" para que se intercambie, si es verdadera se va a poner en falso y si es en falso se va a poner en verdadero
	if get_tree().paused == true:
		global_Var.pausa = true
		$pausa.visible = true
	elif get_tree().paused == false:
		global_Var.pausa = false
		$pausa.visible = false
		global_Var.pausa = false



