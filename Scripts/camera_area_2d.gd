class_name CameraArea2D
extends Area2D

@export_node_path("Camera2D") var cameraToActivate


func _on_body_entered(body: RigidBody2D) -> void:
	var camera: Camera2D = get_node(cameraToActivate)
	get_viewport().get_camera_2d().enabled = false
	camera.enabled = true
