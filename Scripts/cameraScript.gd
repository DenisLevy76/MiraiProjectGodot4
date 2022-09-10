extends Camera3D

@export var target_path: NodePath

@onready var target: CharacterBody3D = get_node(target_path)

func _process(delta):
	if target: position = Vector3(target.position.x - 8, target.position.y + 5, target.position.z)
