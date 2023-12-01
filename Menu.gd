extends Node2D



func _on_inicio_pressed():
	get_tree().change_scene_to_file("res://Scenes/map_scene.tscn")
	pass # Replace with function body.


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/creditos.tscn")
	pass # Replace with function body.
