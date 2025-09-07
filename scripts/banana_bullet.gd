extends Node2D

var velocity := Vector2.ZERO
var gravity := 0.0

var rotate_speed := 600.0
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()
	
	rotate(rotate_speed * delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Terrain"):
		queue_free() 

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("OOB"):
		queue_free()
