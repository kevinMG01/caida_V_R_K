extends Control


onready var scroller: ScrollContainer = $ScrollContainer
onready var animation_tree : AnimationTree = $AnimationTree

var is_scrolling : bool = false


#movimiento de scroll manual que hara el usuario
var is_manual_scrolling : bool = false
var scroll_to : float = 0 # asta cualdo queremos hacer
var scroll_to_index : int = 0 # animation tree


func _ready():
	yield(get_tree(), "idle_frame")
	scroller.scroll_horizontal = rect_size.x * 2 #nosda el tamaaño de la ventana y mueve 2 posicciones mas
	pass # Replace with function body.


func _process(delta):
	
	if is_manual_scrolling:
		if abs(int(round(scroll_to))-scroller.scroll_horizontal) > 5:
			animation_tree["parameters/blend_position"] = lerp(animation_tree["parameters/blend_position"],int(round(scroll_to/rect_size.x)),0.1)
			scroller.scroll_horizontal = lerp(scroller.scroll_horizontal,scroll_to, 0.2)
		else:
			animation_tree["parameters/blend_position"] = scroll_to_index
			scroller.scroll_horizontal = scroll_to
			is_manual_scrolling = false
			set_process(false)
	else:
		var scroll = scroller.scroll_horizontal/rect_size.x # nos da como un indise, sabremos en que posicion bamos a paserle el scroler, para la animacion
		if is_scrolling:
			animation_tree["parameters/blend_position"] = scroll
		elif abs(int(round(scroll))-scroll) > 0.01:
			animation_tree["parameters/blend_position"] = lerp(animation_tree["parameters/blend_position"],int(round(scroll)),0.1)
			scroller.scroll_horizontal = lerp(scroller.scroll_horizontal,rect_size.x * int(round(scroll)), 0.2)
		else:
			animation_tree["parameters/blend_position"] = int(round(scroll))
			scroller.scroll_horizontal = rect_size.x * int(round(scroll))
			set_process(false)
	pass






#scroll_to = (rect_size.x * extra_arg_0)
#	scroll_to_index = extra_arg_0
#	is_manual_scrolling = true
#	set_process(true)











