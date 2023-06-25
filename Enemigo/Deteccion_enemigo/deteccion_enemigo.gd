extends Node2D


onready var sprite = $"DeteccionEnemigo-removebg-preview"

var target_position = null


func _physics_process(delta):
	var canvas = get_canvas_transform()
	var top_left = -canvas.origin / canvas.get_scale()
	var size = get_viewport_rect().size / canvas.get_scale()
	
	set_market_position(Rect2(top_left, size))
	set_market_rotation()


func set_market_position(bounds : Rect2):
	if target_position == null:
		sprite.global_position.x = clamp(global_position.x, bounds.position.x, bounds.end.x)
		sprite.global_position.y = clamp(global_position.y, bounds.position.x, bounds.end.y)
	else:
		var displacement = global_position - target_position
		var length
		
		var tl = (bounds.position - target_position).angle()
		var tr = (Vector2(bounds.end.x, bounds.position.y) - target_position).angle()
		var bl = (Vector2(bounds.position.x, bounds.end.y) - target_position).angle()
		var br = (bounds.end - target_position).angle()
		
		
	if bounds.has_point(global_position):
		hide()
	else:
		show()
	
func set_market_rotation():
	var angle = (global_position - sprite.global_position).angle()
	sprite.global_position = angle 
	
	








