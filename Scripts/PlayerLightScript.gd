extends SpotLight3D


@export var target_path: NodePath

@onready var target: CharacterBody3D = get_node(target_path)

@export var x_distance: float = 0
@export var y_distance: float = 15
@export var z_distance: float = 0

func _process(delta):
	if target: position = Vector3(target.position.x - x_distance, target.position.y + y_distance, target.position.z + z_distance)
	else:
		queue_free()
