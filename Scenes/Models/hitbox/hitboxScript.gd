extends Area3D

func _on_hitbox_body_entered(body):
	body.position = Vector3.ZERO
