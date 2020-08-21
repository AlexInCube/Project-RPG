if keyboard_check_pressed(global.developer_key){
	debugmode=!debugmode
	show_debug_overlay(debugmode)
	with(obj_trigger)visible=!visible
	with(obj_cutscene_perm_trigger)visible = !visible
	with(obj_cutscene_trigger)visible = !visible
	with(obj_door)visible = !visible
}