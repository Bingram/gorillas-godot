extends Sprite2D

@export var speed:float = 10

func _process(delta: float) -> void:
	rotate(speed * delta)
