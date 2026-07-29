extends Control




func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://special_scene/main_menu.tscn")
	
