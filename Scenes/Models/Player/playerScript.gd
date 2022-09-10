extends CharacterBody3D


@export var SPEED: float = 5.0
@export var JUMP_VELOCITY: float = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_flipped = false
var is_jumping = false

@onready var _animation_tree = $AnimationTree


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		
	if is_jumping and velocity.y > 0:
		_animation_tree["parameters/playback"].travel("falling")
	if velocity.y < 0 and not is_on_floor():
		_animation_tree["parameters/playback"].travel("falling")
		is_jumping = false
	
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
