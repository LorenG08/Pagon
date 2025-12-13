extends Area2D
@onready var fruit: Label = $fruit

@export var dialogue_path: String ="res://dialogues/fruit3.dialogue"

var player_in_area = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	fruit.visible = false


func _on_body_entered(body):
	if body.name == "player":
		player_in_area = true
		fruit.visible = true


func _on_body_exited(body):
	if body.name == "player":
		player_in_area = false
		fruit.visible = false


func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		Global.area_entered = true
		DialogueManager.show_dialogue_balloon(load(dialogue_path))
	if Global.fruit3_holder == true:
		queue_free()
