class_name GolfBall
extends CharacterBody2D
@onready var horizontal: RayCast2D = $Horizontal
@onready var vertical: RayCast2D = $Vertical
@onready var trail: Polygon2D = $Trail

var LastHold

@export var raycastDistance = 12
@export var speed = 5



var currentSpeed = 0

func _ready():
	horizontal.target_position.x = raycastDistance
	vertical.target_position.y = raycastDistance
	velocity = Vector2(0, 0)

var input = false



func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("shoot"):
		LastHold = global_position
		
	if event.is_action_released("shoot") and input and get_global_mouse_position().distance_to(LastHold) > 1:
		var currentSpeed = clampf(get_global_mouse_position().distance_to(LastHold)*5, 0, speed)
		velocity = get_global_mouse_position().direction_to(LastHold)*currentSpeed
		horizontal.target_position.x = (get_global_mouse_position().direction_to(LastHold).x)* raycastDistance
		vertical.target_position.y = (get_global_mouse_position().direction_to(LastHold).y)* raycastDistance
		
	

func _physics_process(delta: float) -> void:
	
	
	input = (convert(velocity.x,TYPE_INT) == 0)
	
	
	trail.visible = input
	if input:
		if trail.polygon[1] != null:
			trail.polygon[1].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			trail.polygon[2].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			
	trail.look_at(global_position + -global_position.direction_to(get_global_mouse_position()))
	
	if horizontal.is_colliding():
		velocity.x *= -1
		horizontal.target_position.x *= -1
	if vertical.is_colliding():
		velocity.y *= -1
		vertical.target_position.y *= -1
	
	
	velocity += (-velocity * 0.03)
	
	
	
	
	
	move_and_slide()
