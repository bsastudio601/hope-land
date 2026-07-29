extends Node2D

@export var turn_on_stage := 20

@onready var light: PointLight2D = $PointLight2D

func _ready() -> void:
	GameState.stage_changed.connect(update_light)
	update_light()

func update_light() -> void:
	light.enabled = GameState.stage >= turn_on_stage
