extends CharacterBody3D


@export var SPEED: float = 650
@export var JUMP_MAX_HEIGHT: float = 25
@export var JUMP_MIN_HEIGHT: float = 10

@export var target_path: NodePath
@onready var camera: Camera3D = get_node(target_path)

@export var camera_x_distance: float = 10
@export var camera_y_distance: float = 5
@export var camera_z_distance: float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_flipped = false

@onready var _animation_tree = $AnimationTree

func _physics_process(delta):
	if camera: camera.position = Vector3(position.x - camera_x_distance, position.y + camera_y_distance, position.z + camera_z_distance)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"): 
			velocity.y = JUMP_MAX_HEIGHT
	else:
		velocity.y -= gravity * delta
		_animation_tree["parameters/playback"].travel("falling")
		
		if Input.is_action_just_released("jump") and velocity.y > JUMP_MIN_HEIGHT:
			velocity.y = JUMP_MIN_HEIGHT
		
	move(delta)
	move_and_slide()

func move(delta: float):
	if Input.is_action_pressed("left"):
		move_left(delta)
	elif Input.is_action_pressed("right"):
		mode_right(delta)
	else:
		move_to_idle()

func move_to_idle():
	if is_on_floor(): _animation_tree["parameters/playback"].travel("idle")
	velocity.z = 0

func move_left(delta):
	if is_on_floor(): _animation_tree["parameters/playback"].travel("running")
	_flip_left()
	velocity.z = -SPEED * delta

func mode_right(delta):
	if is_on_floor(): _animation_tree["parameters/playback"].travel("running")
	_flip_right()
	velocity.z = SPEED * delta

func _flip_left():
	pass
	if not is_flipped:
		scale.z = -1
		is_flipped = true

func _flip_right():
	if is_flipped: 
		scale.z = 1
		is_flipped = false		
