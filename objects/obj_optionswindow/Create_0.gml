event_inherited();

enum settings_element_type{
	slider,
	shift,
	toggle,
	input,
	title
}


window_name=scr_find_keyword("settings")
window_width=450
window_height=300

drawelementstart = 0//Start drawing ds_grid from position (height)



scr_create_ds_grid_settings()

inputting=false
toinput=0
applyword=scr_find_keyword("apply_settings")
declineword=scr_find_keyword("decline_settings")
set_to_defaultword=scr_find_keyword("set_to_default")
