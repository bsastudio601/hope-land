extends Node

signal stage_changed

var stage: int = 0

func set_stage(new_stage: int) -> void:
	stage = new_stage
	stage_changed.emit()

func next_stage() -> void:
	stage += 1
	stage_changed.emit()
