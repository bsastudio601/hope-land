extends CanvasModulate

@export var night_from := 20
@export var night_until := 30

func _ready() -> void:
	GameState.stage_changed.connect(update_time)
	update_time()

func update_time() -> void:
	if GameState.stage >= night_from and GameState.stage <= night_until:
		color = Color.html("#5D6885")
	else:
		color = Color.WHITE
