extends Node3D

var sensitivity = 0.2
@onready var raycast = $Camera3D/RayCast3D
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
	var object = raycast.get_collider()
	if raycast.is_colliding():
		if object.is_in_group("pickable"):
			if Input.is_action_pressed("interact"):
				object.global_transform = hand.global_transform
				object.global_rotation = hand.global_rotation
				object.collision_layer = 2
				object.linear_velocity = Vector3(0.1, 3, 0)
