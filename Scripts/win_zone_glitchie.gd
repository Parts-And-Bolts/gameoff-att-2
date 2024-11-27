extends WinZone

func _on_golf_ball_entered(body: RigidBody2D) -> void:
	if !entered:
		entered = not entered
		WinSound.play()
		body.global_position = global_position
		body.linear_velocity = Vector2.ZERO
		body.modulate.a = 0
		
		FlagAnimation.play("default")
		await get_tree().create_timer(0.5).timeout
		
		PlayerData.glitchinessFound += 1
		
		Scenetransition.change_scenes(NextLevel)
