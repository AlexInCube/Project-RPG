if keyboard_check_pressed(global.developer_key){
	DEBUGMODE = !DEBUGMODE
	var visibility = DEBUGMODE
	show_debug_overlay(DEBUGMODE)
	with(obj_trigger)visible = visibility
	with(obj_cutscene_perm_trigger)visible = visibility
	with(obj_cutscene_trigger)visible = visibility
	with(obj_door)visible = visibility
	with(obj_mob_spawner)visible = visibility
}