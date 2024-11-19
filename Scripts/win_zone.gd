class_name WinZone
extends Area2D

@export_file() var NextLevel:String
@export var FlagAnimation: AnimationPlayer

func _on_golf_ball_entered(body: CharacterBody2D) -> void:
	body.global_position = global_position
	body.velocity = Vector2.ZERO
	body.modulate.a = 0
	FlagAnimation.play("default")
	await get_tree().create_timer(0.5).timeout
	Scenetransition.change_scenes(NextLevel)
