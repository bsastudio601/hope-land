extends CharacterBody2D 
@onready var path: Path2D = $"../Path2D"
@onready var path_follow: PathFollow2D = $"../Path2D/PathFollow2D"
@export var move_speed:float = 50.0 
@export var loop_path:bool = false

var last_position: Vector2 

func _ready() -> void: 
	position = path_follow.global_position 
	last_position = position 
	path_follow.loop = loop_path
	pass 
func _physics_process(delta: float) -> void:

	if !loop_path:
		if path_follow.progress >= path.curve.get_baked_length():
			return

	path_follow.progress += move_speed * delta

	global_position = path_follow.global_position

	var movement = global_position - last_position

	last_position = global_position
