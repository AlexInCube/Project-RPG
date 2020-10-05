if keyboard_check_pressed(global.developer_key){
	debugmode = !debugmode
	var visibility = debugmode
	show_debug_overlay(debugmode)
	with(obj_trigger)visible = visibility
	with(obj_cutscene_perm_trigger)visible = visibility
	with(obj_cutscene_trigger)visible = visibility
	with(obj_door)visible = visibility
}