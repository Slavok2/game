extends Node3D

var sensitivity = 0.2
@onready var raycast: RayCast3D = $Camera3D/RayCast3D
@onready var hand: Node3D = $Hand

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		get_parent().rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()

func _process(delta: float) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()

		if collider and collider.is_in_group("pickable"):
			if Input.is_action_pressed("interact"):
				if collider is RigidBody3D:
					collider.global_transform = hand.global_transform
					collider.linear_velocity = Vector3(0.1, 3, 0)
