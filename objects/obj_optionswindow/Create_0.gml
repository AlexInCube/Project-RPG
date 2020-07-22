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

/*
Title - Settings Category
Slider - It was earlier a slider,
but now the slide has been replaced by arrows and the last digit of the array determines the gradation as far as the value should be shifted by the arrow.
Shift - Same as the slider, but with a gradation of 1.
Toggle - Change value to TRUE or FALSE
Input - Change the assigned key

The last value is instant apply, for example, for audio.
1 - instant apply
0 - applying after press apply button
*/

scr_create_ds_grid_settings()

inputting=false
toinput=0
applyword=scr_find_keyword("apply_settings")
declineword=scr_find_keyword("decline_settings")
set_to_defaultword=scr_find_keyword("set_to_default")
