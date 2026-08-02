extends Area2D

@export var dialouge_resources: DialogueResource
@export var dialouge_start = "start"
@export var from: int = 0
@export var until: int = 0

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var wall: CollisionShape2D = $"../CollisionShape2D"

var triggered := false

func _ready() -> void:
	GameState.stage_changed.connect(update_active)
	update_active()
	body_entered.connect(_on_body_entered)

func update_active() -> void:
	var active: bool = GameState.stage >= from and GameState.stage <= until

	collision.disabled = not active
	wall.disabled = not active
	visible = active

	if !active:
		triggered = false

func _on_body_entered(body: Node2D) -> void:
	if !body.is_in_group("player"):
		return

	if triggered:
		return

	triggered = true
	DialogueManager.show_dialogue_balloon(dialouge_resources, dialouge_start)
