if global.day_phase = PHASE_TYPE_NIGHT or global.day_phase = PHASE_TYPE_SUNSET{
	draw_light(light_power)
	image_index = 0
}else{
	image_index = 1
}