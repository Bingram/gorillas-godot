extends Node2D

var velocity := Vector2.ZERO
var gravity := 0.0
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()
