extends Control

@onready var main_buttons: VBoxContainer = $main_buttons
@onready var options: Panel = $options

# Buttons
@onready var button_start: Button = $main_buttons/start
@onready var button_load: Button = $main_buttons/load
@onready var button_options: Button = $main_buttons/options
@onready var button_exit: Button = $main_buttons/exit
@onready var button_back: Button = $options/back

func _ready():
	# Show main buttons, hide options panel initially
	main_buttons.visible = true
	options.visible = false

	# Connect buttons to their respective functions
	button_start.pressed.connect(self._on_start_pressed)
	button_load.pressed.connect(self._on_load_pressed)
	button_options.pressed.connect(self._on_options_pressed)
	button_exit.pressed.connect(self._on_exit_pressed)
	button_back.pressed.connect(self._on_back_pressed)


# --- Button callback functions ---
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/levels/level_1_1.tscn")

func _on_load_pressed():
	Global.load_game()

func _on_options_pressed():
	print("Options button pressed")
	main_buttons.visible = false
	options.visible = true

func _on_exit_pressed():
	print("Exit button pressed")
	get_tree().quit()

func _on_back_pressed():
	print("Back button pressed")
	main_buttons.visible = true
	options.visible = false
