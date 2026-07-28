extends CharacterBody2D
@onready var path_in: PathFollow2D = $"../DiponIn/PathFollow2D"
@onready var path_out: PathFollow2D = $"../DiponOut/PathFollow2D"
var current_path: PathFollow2D
@export var move_speed: float = 50.0
var last_position: Vector2
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	GameState.stage_changed.connect(_on_stage_changed)

func _on_stage_changed():

	if GameState.stage == 9:
		current_path = path_in
		current_path.progress = 0

	elif GameState.stage == 10:
		current_path = path_out
		current_path.progress = 0
		
func _physics_process(delta: float) -> void:
	if current_path:
		current_path.progress += move_speed * delta
		global_position = current_path.global_position

		var direction = global_position - last_position

		if direction.y < 0:
			sprite.play("walk_up")
		elif direction.y > 0:
			sprite.play("walk_down")
		elif direction == Vector2.ZERO: 
			sprite.play("idle")


		last_position = global_position
		
		
		
