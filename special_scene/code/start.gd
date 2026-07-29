extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_pressed() -> void:

	get_tree().change_scene_to_file("res://area/subarea/area_1_sub_3.tscn")
