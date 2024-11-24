class_name AreaTeleport2D
extends Area2D

## can it teleport to another portal on touch?
@export var isTeleport: bool

## AreaTeleport2D to teleport to, ONLY WORKS IF "Is Teleport" variable is true
@export_node_path("AreaTeleport2D") var teleport2dLinked

func _ready():
	var foundCollisionshape = false
	
	for i in get_children():
		if i is CollisionShape2D:
			foundCollisionshape = true
	if foundCollisionshape == false:
		push_warning("Collision Shape Not FOUND!")



func _on_body_entered(body: GolfBall) -> void:
	
	if isTeleport:
		
		var teleport2d: AreaTeleport2D = get_node(teleport2dLinked)
		body.move_body(teleport2d.position)
