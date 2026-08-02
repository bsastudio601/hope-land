extends StaticBody2D

@export var from: int = 0
@export var until: int = 0

@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	GameState.stage_changed.connect(update_active)
	update_active()

func update_active() -> void:
	var active: bool = GameState.stage >= from and GameState.stage <= until
	collision.disabled = not active
	visible = active
