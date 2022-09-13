extends Area3D

func _on_hitbox_body_entered(body):
	get_tree().reload_current_scene()
