extends Control

const new_world = preload("res://ui/level_creator/LevelCreator.tscn")

func _new_world():
	get_tree().change_scene_to(new_world)
