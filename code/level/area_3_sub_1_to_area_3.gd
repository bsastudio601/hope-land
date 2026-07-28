extends Area2D

var player_inside := false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false

func _process(delta):
	if player_inside and Input.is_action_just_pressed("next"):
		get_tree().change_scene_to_file("res://area/area_3.tscn")
