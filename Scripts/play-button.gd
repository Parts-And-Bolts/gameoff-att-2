extends Button



func _on_pressed() -> void:
	Scenetransition.change_scenes("res://Scenes/Level 1.tscn")
	disabled = true
