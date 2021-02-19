if global.day_phase = PHASE_TYPE_SUNSET{
	layer_change_tileset("Buildings_Tiles",ts_buildings_night_time)
}else{
	layer_change_tileset("Buildings_Tiles",ts_buildings)
}