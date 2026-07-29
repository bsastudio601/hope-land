extends Node2D

@export var turn_on_from := 20
@export var turn_on_until := 30

@onready var light: PointLight2D = $PointLight2D

func _ready() -> void:
	GameState.stage_changed.connect(update_light)
	update_light()

func update_light() -> void:
	light.enabled = GameState.stage >= turn_on_from and GameState.stage <= turn_on_until
