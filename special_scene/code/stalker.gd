extends CharacterBody2D

@export var visible_from := 20
@export var visible_until := 21

func _ready() -> void:
	GameState.stage_changed.connect(check_stage)
	check_stage()

func check_stage():
	visible = GameState.stage >= visible_from and GameState.stage <= visible_until
