if global.day_phase = PHASE_TYPE_NIGHT or global.day_phase = PHASE_TYPE_SUNSET{
	layer_change_tileset("Buildings_Tiles",ts_buildings_night_time)
	switch(type){
		case light_type.circle: 
			draw_light(light_power)
		break
	
		case light_type.rectangle:
			draw_light_roundrect(x1,y1,x2,y2)	
		break
	}
}else{
	layer_change_tileset("Buildings_Tiles",ts_buildings)
}