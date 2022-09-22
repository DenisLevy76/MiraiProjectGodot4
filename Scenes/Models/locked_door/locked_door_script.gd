extends Area3D


func _on_loked_door_body_entered(body):
	if body is Player:
		if body.key:
			get_tree().reload_current_scene()
		else: print("porta trancada")
