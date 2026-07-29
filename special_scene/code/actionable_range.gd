extends Area2D
@export var dialouge_resources: DialogueResource
@export var dialouge_start = "start"
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

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialouge_resources, dialouge_start)
