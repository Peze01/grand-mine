extends TileMap


var save_path = "user://save.dat"

const BagScreen = preload("res://scenes/bag.tscn")
const DialogBox = preload("res://scenes/dialog_box.tscn")

var all_treasure := []
var no_of_treasure := 0
var occupied_spaces := []
var tool_data := {}
var game_board := []
var tile_healths := {}
var wall_health := 100
var amount_found := 0
var treasure_found_names := []
var inventory := {}

signal inventory_opened(inventory)

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
	#4x2
	all_treasure.append(Treasure.new("Moon Stone", Vector2i(4,2), Vector2i(12,22)))
	all_treasure.append(Treasure.new("Everstone", Vector2i(4,2), Vector2i(2,37)))
	#3x6
	all_treasure.append(Treasure.new("Rare Bone", Vector2i(3,6), Vector2i(0,40)))

func create_save():
	if !FileAccess.file_exists(save_path):
		for treasure in all_treasure:
			inventory[treasure.get_name()] = 0
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_string(JSON.stringify(inventory))
		file.close()
		
func save():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_string(JSON.stringify(inventory))
		file.close()

func load_save():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		inventory = JSON.parse_string(file.get_as_text())
	else:
		create_save()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	init_treasure()
	load_save()
	init_tools()
	setup_game()

func _input(event):
	if Input.is_action_just_pressed("interact"):
		var interact_pos = local_to_map(get_global_mouse_position())
		if interact_pos.x in range(0,13) && interact_pos.y in range(2,12):
			destroy_rocks(interact_pos)

func init_tools():
	tool_data = {
		"Pickaxe" = {
			"Center" = 2,
			"Adjacent" = 1,
			"Corners" = 0,
			"Wall" = 2
		},
		"Hammer" = {
			"Center" = 2,
			"Adjacent" = 2,
			"Corners" = 1,
			"Wall" = 4
		}
	}
		
func destroy_rocks(center_pos):
	var current_tool = {}
	if $HammerButton.button_pressed:
		current_tool = tool_data["Hammer"]
	else:
		current_tool = tool_data["Pickaxe"]
	var start_pos = Vector2i(center_pos.x-1,center_pos.y-1)
	var current_pos = start_pos
	wall_health-=current_tool["Wall"]
	print(wall_health)
	check_wall_health()
	for x in range(3):
		current_pos.x = start_pos.x + x
		for y in range(3):
			current_pos.y = start_pos.y + y
			if tile_healths.has(current_pos):
				if is_corner(center_pos, current_pos):
					tile_healths[current_pos]-=current_tool["Corners"]
				elif is_adjacent(center_pos, current_pos):
					tile_healths[current_pos]-=current_tool["Adjacent"]
				else:
					tile_healths[current_pos]-=current_tool["Center"]
				update_tiles()
			else:
				continue
	check_treasure_found()

func do_dialogue(message):
	var dialog_box = DialogBox.instantiate()
	add_child(dialog_box)
	dialog_box.start_dialogue(message)
func check_wall_health():
	if wall_health<1:
		do_dialogue("Game Over. You found " + str(amount_found)+ " pieces of treasure!")
		print("Game Over. You found ",amount_found," pieces of treasure!")
		#for t in treasure_found_names:
			#do_dialogue(t + " was added to your Bag!")
		print(treasure_found_names)
		reset_game()

func check_treasure_found():
	var treasure_found = true
	var all_treasure_found = true
	for dict in occupied_spaces:
		if !dict["Found"]:
			for space in dict["Spaces"]:
				if get_cell_tile_data(2,space) != null:
					treasure_found = false
			if treasure_found:
				print(dict["Name"], " was found!")
				dict["Found"] = true
				treasure_found_names.append(dict["Name"])
				inventory[dict["Name"]]+=1
				amount_found+=1
				do_dialogue("You found a(n) " + str(dict["Name"]) +"!")
			else:
				all_treasure_found = false
			treasure_found = true
	if all_treasure_found:
		do_dialogue("All treasure was found!")
		print("All treasure was found!")
		print(treasure_found_names)
		reset_game()
	
	
func update_tiles():
	for tile in tile_healths.keys():
		if tile_healths[tile] < 1:
			erase_cell(2,tile)
		elif tile_healths[tile] == 1:
			set_cell(2,tile,0,Vector2i(32,4),0)
		elif tile_healths[tile] == 2:
			set_cell(2,tile,0,Vector2i(32,5),0)
		elif tile_healths[tile] == 3:
			set_cell(2,tile,0,Vector2i(33,4),0)
		elif tile_healths[tile] == 4:
			set_cell(2,tile,0,Vector2i(33,5),0)
		elif tile_healths[tile] == 5:
			set_cell(2,tile,0,Vector2i(34,4),0)
		elif tile_healths[tile] == 6:
			set_cell(2,tile,0,Vector2i(34,5),0)

		

func setup_game():
	wall_health = 100
	amount_found = 0
	treasure_found_names = []
	generate_treasure()
	generate_rocks()

func reset_game():
	occupied_spaces.clear()
	for x in range(0,13):
		for y in range(2,12):
			erase_cell(1,Vector2i(x,y))
			erase_cell(2,Vector2i(x,y))
			erase_cell(3,Vector2i(x,y))
			erase_cell(4,Vector2i(x,y))
	save()
	setup_game()
			
	
func generate_treasure():
	no_of_treasure = weighted_randi([[3,0.6],[4,0.3],[5,0.1]])
	print(no_of_treasure)
	var spawn_position = Vector2i(0,2)
	var treasure = all_treasure[0]
	var spawn_successful = false
	var attempted_spawns = 0
	for i in range(no_of_treasure):
		treasure = all_treasure[randi_range(0,all_treasure.size()-1)]
		while !spawn_successful:
			spawn_position = Vector2i(randi_range(0,13-treasure.get_size().x),randi_range(2,12-treasure.get_size().y))
			while place_treasure(treasure.get_name(),spawn_position) !=true:
				spawn_position = Vector2i(randi_range(0,13-treasure.get_size().x),randi_range(2,12-treasure.get_size().y))
				attempted_spawns+=1
				if attempted_spawns > 10:
					break
			if attempted_spawns > 10:
					i-=1
					break
			spawn_successful = true
			
		spawn_successful = false
		
func generate_rocks():
	var perlin_noise = FastNoiseLite.new()
	perlin_noise.seed = randi()
	var noise = 0
	for x in range(0,13):
		for y in range(2,12):
			noise = perlin_noise.get_noise_2d(x*10,y*10)
			if noise < -0.3:
				set_cell(2,Vector2i(x,y),0,Vector2i(32,5))
				tile_healths[Vector2i(x,y)] = 2
			elif noise < 0.1:
				set_cell(2,Vector2i(x,y),0,Vector2i(33,5))
				tile_healths[Vector2i(x,y)] = 4
			else:
				set_cell(2,Vector2i(x,y),0,Vector2i(34,5))
				tile_healths[Vector2i(x,y)] = 6
			
			
				


func place_treasure(treasure_name, treasure_position):
	var treasure = find_treasure_by_name(treasure_name)
	var start = treasure.get_atlas_coords()
	var current_atlas_coords = start
	var current_position = treasure_position
	var positions_to_place = []
	for y in range(treasure.get_size().y):
		for x in range(treasure.get_size().x):
			current_atlas_coords.x = start.x + x
			if get_tileset().get_source(0).has_tile(Vector2i(start.x+x, start.y+y)):
				for dict in occupied_spaces:	
					if current_position in dict["Spaces"]:
						return false
				positions_to_place.append([current_position,current_atlas_coords])
			current_position.x+=1
		current_position.x = treasure_position.x
		current_position.y+=1
		current_atlas_coords.x = start.x
		current_atlas_coords.y+=1
	var treasure_spaces = {
		"Name" = treasure_name,
		"Spaces" = [],
		"Found" = false
	}
	for pos in positions_to_place:
		treasure_spaces["Spaces"].append(pos[0])
		set_cell(1,pos[0],0,pos[1],0)
	occupied_spaces.append(treasure_spaces)
	return true

func weighted_randi(rand_info):
	var rng = randf()
	var check = 0
	for option in rand_info:
		check+=option[1]
		if rng < check:
			return option[0]
	print("weighted_randi: weight info is invalid")
	return-1

func find_treasure_by_name(treasure_name):
	for x in all_treasure:
		if x.get_name() == treasure_name:
			return x
	print("find_treasure_by_name: not found")
	return null

func is_corner(center_pos, check_pos):
	if abs(center_pos.x-check_pos.x)==1 && abs(center_pos.y-check_pos.y)==1:
		return true
	#elif center_pos.x+1==check_pos.x && center_pos.y-1==check_pos.y:
		#return true
	#elif center_pos.x-1==check_pos.x && center_pos.y+1==check_pos.y:
		#return true
	#elif center_pos.x+1==check_pos.x && center_pos.y+1==check_pos.y:
		#return true
	return false

func is_adjacent(pos, check_pos):
	if abs(pos.x-check_pos.x)==1 && pos.y==check_pos.y:
		return true
	elif abs(pos.y-check_pos.y)==1 && pos.x==check_pos.x:
		return true
	return false
		
func _on_bag_button_pressed():
	var bag_menu = BagScreen.instantiate()
	var item_container = bag_menu.get_node("Item Scroll/Item List/Item")
	for item in inventory.keys():
		var new_item_container = item_container.duplicate()
		new_item_container.get_node("Item Name").text = str(item)
		new_item_container.get_node("Item Amount").text = "x"+ str(inventory[item])
		new_item_container.visible = true
		bag_menu.get_node("Item Scroll/Item List").add_child(new_item_container)
	add_child(bag_menu)
	
	
	
