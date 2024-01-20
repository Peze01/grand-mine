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
var no_of_treasure := 0
var occupied_spaces := []


func init_treasure():
	#2x2
	all_treasure.append(Treasure.new("Red Sphere", Vector2i(2,2), Vector2i(2,0)))
	all_treasure.append(Treasure.new("Blue Sphere", Vector2i(2,2), Vector2i(4,0)))
	all_treasure.append(Treasure.new("Green Sphere", Vector2i(2,2), Vector2i(0,0)))
	all_treasure.append(Treasure.new("Prism Sphere", Vector2i(2,2), Vector2i(6,0)))
	all_treasure.append(Treasure.new("Pale Sphere", Vector2i(2,2), Vector2i(8,0)))
	all_treasure.append(Treasure.new("Heart Scale", Vector2i(2,2), Vector2i(9,32)))
	all_treasure.append(Treasure.new("Hard Stone", Vector2i(2,2), Vector2i(0,37)))
	#3x3
	all_treasure.append(Treasure.new("Large Red Sphere", Vector2i(3,3), Vector2i(3,2)))
	all_treasure.append(Treasure.new("Large Blue Sphere", Vector2i(3,3), Vector2i(6,2)))
	all_treasure.append(Treasure.new("Large Green Sphere", Vector2i(3,3), Vector2i(0,2)))
	all_treasure.append(Treasure.new("Large Prism Sphere", Vector2i(3,3), Vector2i(9,2)))
	all_treasure.append(Treasure.new("Large Pale Sphere", Vector2i(3,3), Vector2i(12,2)))
	all_treasure.append(Treasure.new("Red Shard", Vector2i(3,3), Vector2i(4,25)))
	all_treasure.append(Treasure.new("Blue Shard", Vector2i(3,3), Vector2i(7,25)))
	all_treasure.append(Treasure.new("Damp Rock", Vector2i(3,3), Vector2i(4,29)))
	all_treasure.append(Treasure.new("Fire Stone", Vector2i(3,3), Vector2i(3,21)))
	all_treasure.append(Treasure.new("Water Stone", Vector2i(3,3), Vector2i(6,21)))
	all_treasure.append(Treasure.new("Thunderstone", Vector2i(3,3), Vector2i(9,21)))
	all_treasure.append(Treasure.new("Sun Stone", Vector2i(3,3), Vector2i(16,21)))
	all_treasure.append(Treasure.new("Oval Stone", Vector2i(3,3), Vector2i(11,32)))
	all_treasure.append(Treasure.new("Iron Ball", Vector2i(3,3), Vector2i(10,37)))
	all_treasure.append(Treasure.new("Max Revive", Vector2i(3,3), Vector2i(3,32)))
	all_treasure.append(Treasure.new("Revive", Vector2i(3,3), Vector2i(0,32)))
	all_treasure.append(Treasure.new("Star Piece", Vector2i(3,3), Vector2i(6,32)))
	#4x4
	all_treasure.append(Treasure.new("Skull Fossil", Vector2i(4,4), Vector2i(0,5)))
	all_treasure.append(Treasure.new("Helix Fossil", Vector2i(4,4), Vector2i(5,10)))
	all_treasure.append(Treasure.new("Old Amber", Vector2i(4,4), Vector2i(9,5)))
	all_treasure.append(Treasure.new("Smooth Rock", Vector2i(4,4), Vector2i(11,28)))
	all_treasure.append(Treasure.new("Icy Rock", Vector2i(4,4), Vector2i(7,28)))
	all_treasure.append(Treasure.new("Light Clay", Vector2i(4,4), Vector2i(6,36)))
	all_treasure.append(Treasure.new("Odd Keystone", Vector2i(4,4), Vector2i(3,42)))
	#5x5
	all_treasure.append(Treasure.new("Root Fossil",  Vector2i(5,5), Vector2i(0,15)))
	#5x4
	all_treasure.append(Treasure.new("Armor Fossil", Vector2i(5,4), Vector2i(4,5)))
	all_treasure.append(Treasure.new("Dome Fossil", Vector2i(5,4), Vector2i(0,10)))
	#4x5
	all_treasure.append(Treasure.new("Claw Fossil", Vector2i(4,5), Vector2i(5,15)))
	#4x3
	all_treasure.append(Treasure.new("Yellow Shard", Vector2i(4,3), Vector2i(10,25)))
	all_treasure.append(Treasure.new("Green Shard", Vector2i(4,3), Vector2i(0,25)))
	all_treasure.append(Treasure.new("Draco Plate", Vector2i(4,3), Vector2i(8,46)))
	all_treasure.append(Treasure.new("Dread Plate", Vector2i(4,3), Vector2i(4,46)))
	all_treasure.append(Treasure.new("Earth Plate", Vector2i(4,3), Vector2i(4,49)))
	all_treasure.append(Treasure.new("Fist Plate", Vector2i(4,3), Vector2i(16,46)))
	all_treasure.append(Treasure.new("Flame Plate", Vector2i(4,3), Vector2i(20,46)))
	all_treasure.append(Treasure.new("Icicle Plate", Vector2i(4,3), Vector2i(8,49)))
	all_treasure.append(Treasure.new("Insect Plate", Vector2i(4,3), Vector2i(0,46)))
	all_treasure.append(Treasure.new("Iron Plate", Vector2i(4,3), Vector2i(24,49)))
	all_treasure.append(Treasure.new("Meadow Plate", Vector2i(4,3), Vector2i(0,49)))
	all_treasure.append(Treasure.new("Mind Plate", Vector2i(4,3), Vector2i(16,49)))
	all_treasure.append(Treasure.new("Sky Plate", Vector2i(4,3), Vector2i(24,46)))
	all_treasure.append(Treasure.new("Splash Plate", Vector2i(4,3), Vector2i(28,49)))
	all_treasure.append(Treasure.new("Spooky Plate", Vector2i(4,3), Vector2i(28,46)))
	all_treasure.append(Treasure.new("Stone Plate", Vector2i(4,3), Vector2i(20,49)))
	all_treasure.append(Treasure.new("Toxic Plate", Vector2i(4,3), Vector2i(12,49)))
	all_treasure.append(Treasure.new("Zap Plate", Vector2i(4,3), Vector2i(12,46)))
	all_treasure.append(Treasure.new("Heat Rock", Vector2i(4,3), Vector2i(0,29)))
	#3x4
	all_treasure.append(Treasure.new("Leaf Stone", Vector2i(3,4), Vector2i(0,20)))
	#2x4
	all_treasure.append(Treasure.new("Moon Stone", Vector2i(2,4), Vector2i(12,22)))
	all_treasure.append(Treasure.new("Everstone", Vector2i(2,4), Vector2i(2,37)))
	#3x6
	all_treasure.append(Treasure.new("Rare Bone", Vector2i(3,6), Vector2i(0,40)))
	
	
	

#func get_treasure_type(name):
	#for x in treasure_data:
		#if name in x[1]:
			#return x[0]
	#print("get_treasure_type: not found")
	#return -1
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_treasure()
	setup_game()
	print(no_of_treasure)



func place_treasure(name, position):
	var treasure = find_treasure_by_name(name)
	var start = treasure.get_atlas_coords()
	var current_atlas_coords = start
	var current_position = position
	var positions_to_place = []
	for y in range(treasure.get_size().y):
		for x in range(treasure.get_size().x):
			current_atlas_coords.x = start.x + x
			if get_tileset().get_source(0).has_tile(Vector2i(start.x+x, start.y+y)):
				if current_position in occupied_spaces:
					return false
				positions_to_place.append([current_position,current_atlas_coords])
			current_position.x+=1
		current_position.x = position.x
		current_position.y+=1
		current_atlas_coords.x = start.x
		current_atlas_coords.y+=1
	for pos in positions_to_place:
		occupied_spaces.append(pos[0])
		set_cell(1,pos[0],0,pos[1],0)
	return true

func find_treasure_by_name(name):
	var i = 0
	for x in all_treasure:
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

func weighted_randi(rand_info):
	var rng = randf()
	var check = 0
	for option in rand_info:
		check+=option[1]
		if rng < check:
			return option[0]
	print("weighted_randi: weight info is invalid")
	return-1

func generate_treasure():
	no_of_treasure = weighted_randi([[2,0.2],[3,0.5],[4,0.2],[5,0.1]])
	var spawn_position = Vector2i(0,2)
	var treasure = all_treasure[0]
	var spawn_successful = false
	for i in range(no_of_treasure):
		treasure = all_treasure[randi_range(0,all_treasure.size()-1)]
		while !spawn_successful:
			spawn_position = Vector2i(randi_range(0,13-treasure.get_size().x),randi_range(2,12-treasure.get_size().y))
			while place_treasure(treasure.get_name(),spawn_position) !=true:
				spawn_position = Vector2i(randi_range(0,13-treasure.get_size().x),randi_range(2,12-treasure.get_size().y))
			spawn_successful = true
		spawn_successful = false
		
func generate_rocks():
	var perlin_noise = FastNoiseLite.new()
	perlin_noise.seed = randi()
	var noise = 0
	for x in range(0,13):
		for y in range(2,12):
			set_cell(2,Vector2i(x,y),0,Vector2i(32,5))
			noise = perlin_noise.get_noise_2d(x*10,y*10)
			print(noise)
			if noise < 0:
				set_cell(3,Vector2i(x,y),0,Vector2i(33,5))
			else:
				set_cell(3,Vector2i(x,y),0,Vector2i(33,5))
				set_cell(4,Vector2i(x,y),0,Vector2i(34,5))
			
			
			
		
