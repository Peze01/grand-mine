class_name Treasure

var treasure_name
var treasure_size
var treasure_atlas_coords

# Called when the node enters the scene tree for the first time.
func _init(name, size, coords):
	treasure_name = name
	treasure_size = size
	treasure_atlas_coords = coords

func get_name():
	return treasure_name
	
func get_size():
	return treasure_size
	
func get_atlas_coords():
	return treasure_atlas_coords

