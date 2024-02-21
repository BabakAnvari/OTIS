extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_properties_array = read_all_tiles()

	# Now you can iterate over the array and use the properties
	for tile_properties in tile_properties_array:
		var x = tile_properties[0].x
		var y = tile_properties[0].y
		var block_id = tile_properties[1]

		print(x, y, block_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func read_all_tiles() -> Array:
	var tile_properties_array = []

	# Get the tile size from the TileMap node in the scene
	var tile_size = $TileMap.cell_size

	# Iterate over all tiles in the TileMap
	for x in range($TileMap.get_used_rect().size.x):
		for y in range($TileMap.get_used_rect().size.y):
			var world_position = $TileMap.map_to_world(Vector2(x, y) * tile_size)
			var tile_coordinates = $TileMap.world_to_map(world_position)

			if $TileMap.get_cell(x, y) != -1:
				var tile_data = $TileMap.tile_set.tile_get_tile_data($TileMap.get_cell(x, y))
				var tile_properties = read_tile(tile_data)
				tile_properties_array.append(tile_properties)

	return tile_properties_array

func read_tile(tile_data: TileData) -> Array:
	var tile_properties = []

	# Coordinates
	var tile_coordinates = Vector2i(tile_data.texture_origin.x, tile_data.texture_origin.y)
	tile_properties.append(tile_coordinates)

	# Block ID
	var block_id = tile_data.terrain_set  # You may modify this based on your requirements
	tile_properties.append(block_id)

	print(tile_coordinates, ", ", block_id)

	return tile_properties
