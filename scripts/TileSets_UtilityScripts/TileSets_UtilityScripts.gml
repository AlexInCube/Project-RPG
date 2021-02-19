function layer_change_tileset(layer_name,tileset_name){
	var lay_id = layer_get_id(layer_name);
	var tile_id = layer_tilemap_get_id(lay_id);
	tilemap_tileset(tile_id, tileset_name);
}