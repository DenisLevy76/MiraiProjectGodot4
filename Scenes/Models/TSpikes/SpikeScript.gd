extends Area3D

func _on_spike_body_entered(body):
	if body is Player: queue_free()
