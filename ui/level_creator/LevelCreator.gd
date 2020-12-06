extends VBoxContainer

const world = preload("res://world/World.tscn")

onready var world_size = $VBoxContainer/HSlider

func _create_world():
	var root = get_node("/root")
	
	var next_level = world.instance()
	next_level.world_size = int(world_size.value)
	root.add_child(next_level)
	
	root.remove_child(self)
	call_deferred("free")
