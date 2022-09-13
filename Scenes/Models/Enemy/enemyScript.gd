extends CharacterBody3D


const SPEED = 600
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction = 1

@onready var leftRayCast := $LeftRayCast
@onready var rightRayCast := $RightRayCast

func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_edge = not leftRayCast.is_colliding() or not rightRayCast.is_colliding()
	
	if not is_on_floor() and velocity.y > -100:
		velocity.y -= gravity * delta
	
	
	if found_wall or found_edge:
		direction *= -1
		
	if direction:
		velocity.z = direction * SPEED * delta

	move_and_slide()
