extends GolfBall

func _input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	
	input = (convert(linear_velocity.x,TYPE_INT) == 0 && convert(linear_velocity.y,TYPE_INT) == 0)
	
	
	trail.visible = false
	if input:
		LastHold = (global_position + Vector2(randf_range(-200,200),randf_range(-200,200)))
		var currentSpeed = clampf(get_global_mouse_position().distance_to(LastHold)*5, 0, speed)
		linear_velocity = get_global_mouse_position().direction_to(LastHold)*currentSpeed
		if trail.polygon[1] != null:
			trail.polygon[1].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			trail.polygon[2].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			
	trail.look_at(global_position + -global_position.direction_to(get_global_mouse_position()))
	linear_velocity -= (linear_velocity*0.005)
