extends CanvasLayer
@export var text: String = "[Inset TEXT]"
@export var required_stage: int = 0
@export var is_last_cutscene: bool = false
@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $Label
var active: bool = false

func _ready() -> void:
	layer = 100
	color_rect.modulate.a = 0.0
	label.modulate.a = 0.0
	visible = false
	GameState.stage_changed.connect(_check_stage)
	_check_stage()

func _check_stage() -> void:
	if GameState.stage == required_stage and not active:
		play()

func play() -> void:
	visible = true
	label.text = text
	color_rect.modulate.a = 1.0
	label.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 1.0, 0.6)
	await tween.finished
	active = true

func _unhandled_input(event: InputEvent) -> void:
	if not active:
		return
	if event.is_action_pressed("next"):
		active = false
		await fade_text_out()
		if is_last_cutscene:
			get_tree().change_scene_to_file("res://special_scene/main_menu.tscn")
		else:
			GameState.next_stage()
			queue_free()

func fade_text_out() -> void:
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 0.4)
	await tween.finished
