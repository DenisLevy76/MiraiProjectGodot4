extends Area3D


func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if body is Player:
		body.key = true
		queue_free()
