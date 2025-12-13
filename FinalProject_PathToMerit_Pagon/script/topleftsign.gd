extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "player":
		Global.area_entered_topleft_sign = true



func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		Global.area_entered_sign = false
		
