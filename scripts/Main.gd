extends TileMap


#enum Treasure {
	#RED_SHARD, BLUE_SHARD, GREEN_SHARD, YELLOW_SHARD,
	#HELIX_FOSSIL, DOME_FOSSIL, OLD_AMBER, ROOT_FOSSIL,
	#CLAW_FOSSIL, ARMOR_FOSSIL, SKULL_FOSSIL, RARE_BONE,
	#STAR_PIECE, REVIVE, MAX_REVIVE, IRON_BALL,
	#HEART_SCALE, LIGHT_CLAY, ODD_KEYSTONE, HARD_STONE,
	#FIRE_STONE, WATER_STONE, THUNDERSTONE, LEAF_STONE,
	#MOON_STONE, SUN_STONE, OVAL_STONE, EVERSTONE,
	#SMOOTH_ROCK, HEAT_ROCK, ICY_ROCK, DAMP_ROCK,
	#DRACO_PLATE, DREAD_PLATE, EARTH_PLATE, FIST_PLATE,
	#FLAME_PLATE, ICICLE_PLATE, INSECT_PLATE, IRON_PLATE,
	#MEADOW_PLATE, MIND_PLATE, SKY_PLATE, SPLASH_PLATE,
	#SPOOKY_PLATE, STONE_PLATE, TOXIC_PLATE, ZAP_PLATE,
	#RED_SPHERE, BLUE_SPHERE, GREEN_SPHERE, PRISM_SPHERE,
	#PALE_SPHERE, LARGE_RED_SPHERE, LARGE_BLUE_SPHERE, LARGE_GREEN_SPHERE,
	#LARGE_PRISM_SPHERE,LARGE_PALE_SPHERE
#}


var all_treasure := []

func init_treasure():
	#2x2
	all_treasure.append(Treasure.new("Red Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Blue Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Green Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Prism Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Pale Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Heart Scale", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Hard Stone", Vector2i(2,2), Vector2i(0,0)))
	#3x3
	all_treasure.append(Treasure.new("Large Red Sphere", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Large Blue Sphere", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Large Green Sphere", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Large Prism Sphere", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Large Pale Sphere", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Red Shard", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Blue Shard", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Damp Rock", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Fire Stone", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Water Stone", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Thunderstone", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Sun Stone", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Oval Stone", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Iron Ball", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Max Revive", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Revive", Vector2i(3,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Star Piece", Vector2i(3,3), Vector2i(0,0)))
	#4x4
	all_treasure.append(Treasure.new("Skull Fossil", Vector2i(4,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Helix Fossil", Vector2i(4,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Old Amber", Vector2i(4,4), Vector2i(9,5)))
	all_treasure.append(Treasure.new("Smooth Rock", Vector2i(4,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Icy Rock", Vector2i(4,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Light Clay", Vector2i(4,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Odd Keystone", Vector2i(4,4), Vector2i(0,0)))
	#5x5
	all_treasure.append(Treasure.new("Root Fossil",  Vector2i(5,5), Vector2i(0,0)))
	#5x4
	all_treasure.append(Treasure.new("Armor Fossil", Vector2i(5,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Dome Fossil", Vector2i(5,4), Vector2i(0,0)))
	#4x5
	all_treasure.append(Treasure.new("Claw Fossil", Vector2i(4,5), Vector2i(0,0)))
	#4x3
	all_treasure.append(Treasure.new("Yellow Shard", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Green Shard", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Draco Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Dread Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Earth Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Fist Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Flame Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Icicle Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Insect Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Iron Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Meadow Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Mind Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Sky Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Splash Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Spooky Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Stone Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Toxic Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Zap Plate", Vector2i(4,3), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Heat Rock", Vector2i(4,3), Vector2i(0,0)))
	#3x4
	all_treasure.append(Treasure.new("Leaf Stone", Vector2i(3,4), Vector2i(0,0)))
	#2x4
	all_treasure.append(Treasure.new("Moon Stone", Vector2i(2,4), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Everstone", Vector2i(2,4), Vector2i(0,0)))
	#3x6
	all_treasure.append(Treasure.new("Rare Bone", Vector2i(3,6), Vector2i(0,0)))
	
	
	

#func get_treasure_type(name):
	#for x in treasure_data:
		#if name in x[1]:
			#return x[0]
	#print("get_treasure_type: not found")
	#return -1
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_treasure()
	generate_treasure()
	place_treasure("Old Amber", Vector2i(0,2))


func place_treasure(name, position):
	var treasure = find_treasure_by_name(name)
	var start = treasure.get_atlas_coords()
	var current_atlas_coords = start
	var current_position = position
	for y in range(treasure.get_size().y):
		for x in range(treasure.get_size().x):
			current_atlas_coords.x = start.x + x
			if get_tileset().get_source(0).has_tile(Vector2i(start.x+x, start.y+y)):
				print(current_atlas_coords)
				set_cell(1,current_position,0,current_atlas_coords,0)
			current_position.x+=1
		current_position.x = position.x
		current_position.y+=1
		current_atlas_coords.x = start.x
		current_atlas_coords.y+=1
		
		

func find_treasure_by_name(name):
	var i = 0
	for x in all_treasure:
		print(x.get_name(), name)
		if x.get_name() == name:
			return x
		i+=1
	print("find_treasure_by_name: not found")
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_game():
	generate_treasure()
	generate_rocks()
	
func generate_treasure():
	pass
	
func generate_rocks():
	pass
