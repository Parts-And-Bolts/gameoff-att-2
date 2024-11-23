class_name GolfBall
extends RigidBody2D

@onready var trail: Polygon2D = $Trail

var LastHold


@export var speed = 5



var currentSpeed = 0

func _ready():
	
	linear_velocity = Vector2(0, 0)

var input = false



var reset_state = false
var moveVector: Vector2

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, moveVector)
		reset_state = false

func move_body(targetPos: Vector2):
	moveVector = targetPos;
	reset_state = true;

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("shoot"):
		LastHold = global_position
		
	if event.is_action_released("shoot") and input and get_global_mouse_position().distance_to(LastHold) > 1:
		var currentSpeed = clampf(get_global_mouse_position().distance_to(LastHold)*5, 0, speed)
		linear_velocity = get_global_mouse_position().direction_to(LastHold)*currentSpeed
		
		
	

func _physics_process(delta: float) -> void:
	
	
	input = (convert(linear_velocity.x,TYPE_INT) == 0 && convert(linear_velocity.y,TYPE_INT) == 0)
	
	
	trail.visible = input
	if input:
		if trail.polygon[1] != null:
			trail.polygon[1].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			trail.polygon[2].x = clampf(get_global_mouse_position().distance_to(global_position)*5,0,speed)
			
	trail.look_at(global_position + -global_position.direction_to(get_global_mouse_position()))
	linear_velocity -= (linear_velocity*0.005)
	
	
	
	
	
	
	
	
