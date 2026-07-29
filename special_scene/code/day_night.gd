extends CanvasModulate

@export var night_stage := 20

func _ready() -> void:
	GameState.stage_changed.connect(update_time)
	update_time()

func update_time() -> void:
	if GameState.stage >= night_stage:
		color = Color.html("#5D6885")
	else:
		color = Color.WHITE
