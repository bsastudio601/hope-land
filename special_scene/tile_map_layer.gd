extends TileMapLayer

@export var speed := 50.0

func _ready() -> void:
	pass

func _process(delta):
	position.x += speed * delta

	if position.x >= 480:
		position.x = 0
