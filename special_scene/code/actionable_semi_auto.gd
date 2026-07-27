extends Area2D
@export var dialouge_resources: DialogueResource
@export var dialouge_start = "start"
@export var ResuiredStage: int = 0
@onready var collision: CollisionShape2D = $CollisionShape2D
var triggered: bool = false

func _ready() -> void:
	GameState.stage_changed.connect(update_active)
	update_active()

func update_active() -> void:
	var active: bool = GameState.stage == ResuiredStage
	collision.disabled = not active
	visible = active
	if active:
		triggered = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not triggered:
		triggered = true
		DialogueManager.show_dialogue_balloon(dialouge_resources, dialouge_start)


func _on_level_trigger_auto_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
