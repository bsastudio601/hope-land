extends CharacterBody2D
@export var sprite_stages: Array[int] = []
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	GameState.stage_changed.connect(check_stage)
	check_stage()

func check_stage() -> void:
	if GameState.stage in sprite_stages:
		sprite.play("notices")
	else:
		sprite.play("default")
