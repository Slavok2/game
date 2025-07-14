extends Control

@onready var malachite: Label = $malachite

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	malachite.text = "Malachite:" + str(Global.Malachite)
