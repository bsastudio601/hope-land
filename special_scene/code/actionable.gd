extends Area2D
@export var dialouge_resources: DialogueResource
@export var dialouge_start = "start"
@export var ResuiredStage: int = 0
@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	GameState.stage_changed.connect(update_active)
	update_active()

func update_active() -> void:
	var active: bool = GameState.stage == ResuiredStage
	collision.disabled = not active
	visible = active
	print(name, " -> stage:", GameState.stage, " required:", ResuiredStage, " active:", active)

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialouge_resources, dialouge_start)
