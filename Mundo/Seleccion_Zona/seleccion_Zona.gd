extends Control


onready var scroller: ScrollContainer = $ScrollContainer
onready var animation_tree : AnimationTree = $AnimationTree

var is_scrolling : bool = false


#movimiento de scroll manual que hara el usuario
var is_manual_scrolling : bool = false
var scroll_to : float = 0 # asta cualdo queremos hacer
var scroll_to_index : int = 0 # animation tree


func _ready():
	$Atras/atras_ani.playing = true
	$Adelante/adelante_ani.playing = true
	yield(get_tree(), "idle_frame")
	scroller.scroll_horizontal = rect_size.x * 0 #nosda el tamaaño de la ventana y mueve 2 posicciones mas
	pass 


func _process(delta):
	#indice var scroll = iiiiiiiiiiiiiiii. nos da como in indise
	var scroll= scroller.scroll_horizontal/rect_size.x
	
	if is_scrolling:
		animation_tree["parameters/blend_position"] = scroll 
		
	elif abs(int(round(scroll))-scroll) > 0.01:
		animation_tree["parameters/blend_position"] = lerp(animation_tree["parameters/blend_position"],int(round(scroll)),0.1)
		scroller.scroll_horizontal = lerp(scroller.scroll_horizontal,rect_size.x * int(round(scroll)), 0.2)
	else:
		animation_tree["parameters/blend_position"] = int(round(scroll))
		scroller.scroll_horizontal = rect_size.x * int(round(scroll))
		set_process(false)
	#nose porque no da el "print()" seguro hay un error. fijarse mas tarde
	if scroller.scroll_horizontal == rect_size.x * 3:
		print("hola muundo")
	pass



#scroll manual
func _on_ScrollContainer_scroll_ended():
	is_scrolling = false
	pass

func _on_ScrollContainer_scroll_started():
	is_scrolling = true
	set_process(true)
	pass

#Boton_scroll
func _on_Atras_pressed():
	scroller.scroll_horizontal -= rect_size.x * 1
	pass 

func _on_Adelante_pressed():
	scroller.scroll_horizontal += rect_size.x * 1
	pass 


#Botones de niveles



func _on_Zona_1_N_1_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_1.tscn")
	pass


func _on_Zona_1_N_2_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_2.tscn")
	pass


func _on_Zona_1_N_3_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_3.tscn")
	pass


func _on_Zona_1_N_4_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_4.tscn")
	pass


func _on_Zona_1_N_5_pressed():
	get_tree().change_scene("res://Mundo/Zonas/Zona_1/Nivel_5.tscn")
	pass 
	
	
	
	
