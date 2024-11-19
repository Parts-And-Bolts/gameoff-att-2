class_name sceneManager
extends CanvasLayer
@onready var timer: Timer = $Timer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func change_scenes(scene: String):
	animation_player.play("go-in")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(scene)
	timer.start()
	await timer.timeout
	post_load()

func post_load():
	animation_player.play("go-out")
