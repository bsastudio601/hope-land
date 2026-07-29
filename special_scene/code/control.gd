extends Control
@onready var content_warning = $ContentWarning
@onready var controls_tutorial = $ContentTutorial
@onready var main_menu = $CanvasLayer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	main_menu.visible = false
	controls_tutorial.visible = false
	content_warning.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_accept"):
		return

	if content_warning.visible:
		content_warning.visible = false
		controls_tutorial.visible = true
	elif controls_tutorial.visible:
		controls_tutorial.visible = false
		main_menu.visible = true
		$CanvasLayer/VBoxContainer/start.grab_focus()
