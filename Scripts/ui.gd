class_name UI
extends CanvasLayer

@export var LevelName: String = "Level 1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = LevelName
