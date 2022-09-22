extends AudioStreamPlayer

@export var loop = false
@export var active = true

func _process(delta):
	if not playing and loop and active:
		play()
