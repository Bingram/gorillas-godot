extends RigidBody2D

@export var banana: PackedScene = preload("res://scenes/banana_bullet.tscn")

var gravity := 400.0
var speed := 1500.0
var velocity := Vector2.ZERO
var banana_velocity := 600.0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.is_pressed(): return
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			banana_velocity += 20
			banana_velocity = clamp(banana_velocity, 100, 1500)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			banana_velocity -= 20
			banana_velocity = clamp(banana_velocity, 100, 1500)

func _process(delta: float) -> void:
	$RotPoint.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		var b = banana.instantiate()
		get_parent().add_child(b)
		b.transform = $RotPoint/ShootPoint.global_transform
		b.velocity = b.transform.x * banana_velocity
		b.gravity = gravity
