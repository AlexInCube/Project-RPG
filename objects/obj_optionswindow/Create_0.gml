depth =-100

enum settings_element_type{
	slider,
	shift,
	toggle,
	input,
	title
}


window_name=find_keyword("settings")
window_width=max(GUIHEIGHT,400)
window_height=max(GUIHEIGHT,300)
window_sprite=spr_basicwindow_without_close




drawelementstart = 0//Start drawing ds_grid from position (height)
drawelementheight = round((GUIHEIGHT-20)/24)-2


create_ds_grid_settings()

ds_size = ds_grid_height(ds_options)

inputting=false
toinput=0
input_button_half_width=sprite_get_width(spr_control_button)/2

applyword=find_keyword("apply_settings")
declineword=find_keyword("decline_settings")
set_to_defaultword=find_keyword("set_to_default")