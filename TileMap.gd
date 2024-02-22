extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_properties = []

	for x in range(get_used_rect().size.x):
		for y in range(get_used_rect().size.y):
			var tile_data = TileData.new()  # Assuming TileData is a class you've defined
			tile_data.texture_origin = Vector2(x, y)  # Update the tile_data with the current coordinates

			var tile_info = read_tile(tile_data)
			
			tile_properties.append(tile_info)

	print(tile_properties)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func read_tile(tile_data: TileData) -> Array:
	var tile_properties = []

	# Coordinates
	var tile_coordinates = Vector2i(tile_data.texture_origin.x, tile_data.texture_origin.y)
	tile_properties.append(tile_coordinates)

	# Block ID
	var block_id = tile_data.terrain_set
	tile_properties.append(block_id) 

	return tile_properties
