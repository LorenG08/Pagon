extends CharacterBody2D

@export var SPEED: float = 150.0
@onready var anim = $AnimatedSprite2D

var last_direction := Vector2.DOWN  # default facing down

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

	# Handle animations
	if input_direction != Vector2.ZERO:
		last_direction = input_direction  # store last move direction

		if abs(input_direction.x) > abs(input_direction.y):
			anim.play("ninja_walk")
			anim.flip_h = input_direction.x > 0
		elif input_direction.y < 0:
			anim.play("ninja_up")
		else:
			anim.play("ninja_walk_down")
	else:
		# Idle based on last direction
		if abs(last_direction.x) > abs(last_direction.y):
			anim.play("ninja_idle")
			anim.flip_h = last_direction.x > 0
		elif last_direction.y < 0:
			anim.play("ninja_up")
		else:
			anim.play("ninja_down_idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_just_pressed("checking"):
		print(Global.become_captain)


		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/topleft_sign.dialogue"))


func _ready():
	self.scale = Vector2(1, 1)
	add_to_group("player")
