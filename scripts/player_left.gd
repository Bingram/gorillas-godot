extends CharacterBody2D

var banana_bullet=preload("res://scenes/banana.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept"):
		fire()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
func fire():
	var nana=banana_bullet.instantiate()
	get_parent().add_child(nana)
