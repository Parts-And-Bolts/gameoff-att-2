class_name GolfBall
extends RigidBody2D
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
	linear_velocity = Vector2(0, 0)

var input = false



func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("shoot"):
		LastHold = global_position
		
	if event.is_action_released("shoot") and input and get_global_mouse_position().distance_to(LastHold) > 1:
		var currentSpeed = clampf(get_global_mouse_position().distance_to(LastHold)*5, 0, speed)
		linear_velocity = get_global_mouse_position().direction_to(LastHold)*currentSpeed
		horizontal.target_position.x = (get_global_mouse_position().direction_to(LastHold).x)* raycastDistance
		vertical.target_position.y = (get_global_mouse_position().direction_to(LastHold).y)* raycastDistance
		
	

func _physics_process(delta: float) -> void:
	
	
	input = (convert(linear_velocity.x,TYPE_INT) == 0 && convert(linear_velocity.y,TYPE_INT) == 0)
	
	
	trail.visible = input
	if input:
		if trail.polygon[1] != null:
			trail.polygon[1].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			trail.polygon[2].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			
	trail.look_at(global_position + -global_position.direction_to(get_global_mouse_position()))
	linear_velocity -= (linear_velocity*0.02)
	
	
	
	
	
	
	
	
