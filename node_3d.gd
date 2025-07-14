extends Node3D

@export var spawn_object: PackedScene = preload("res://items/malachite.tscn")

func _ready() -> void:
	pass

func spawn() -> void:
	var obj = spawn_object.instantiate()
	add_child(obj)
	obj.global_position = Vector3(1, 3, 1)
	Global.Malachite -= 1

func _process(delta: float) -> void:
	if Input.is_action_pressed("place"):
		if Global.Malachite > 0:
			spawn()
