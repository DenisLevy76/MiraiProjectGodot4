extends AudioStreamPlayer

@export var loop = false

func _process(delta):
	if not playing and loop:
		play()
