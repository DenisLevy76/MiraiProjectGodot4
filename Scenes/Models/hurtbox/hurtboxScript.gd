extends Area3D


func _on_hurtbox_body_entered(body):
	get_parent().queue_free()
