event_inherited();
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

ds_options = scr_create_menu_page(
	[scr_find_keyword("audio_settings"),		settings_element_type.title],
	[scr_find_keyword("master_volume"),			settings_element_type.slider, scr_change_volume,global.mastervolume,0.05,1],
	[scr_find_keyword("music_volume"),			settings_element_type.slider, scr_change_volume,global.musicvolume,0.05,1],
	[scr_find_keyword("sound_volume"),			settings_element_type.slider, scr_change_volume,global.soundvolume,0.05,1],
	[scr_find_keyword("graphics_settings"),		settings_element_type.title],
	[scr_find_keyword("resolution"),			settings_element_type.shift, scr_change_resolution,0,["1280x720","1536x874","1920x1080"],0],
	[scr_find_keyword("fullscreen_mode"),		settings_element_type.toggle, scr_change_window_mode,global.fullscreen,0],
	[scr_find_keyword("interface_settings"),	settings_element_type.title],
	[scr_find_keyword("gui_size"),				settings_element_type.shift, scr_change_gui_size,global.guisize,[scr_find_keyword("gui_small"),scr_find_keyword("gui_standard"),scr_find_keyword("gui_large")],0],
	[scr_find_keyword("language"),				settings_element_type.shift, scr_change_language,0,["russian","english"],0],
	[scr_find_keyword("show_damage"),			settings_element_type.toggle, scr_change_show_damage,global.showdamage,1],
	[scr_find_keyword("controls_settings"),		settings_element_type.title],
	[scr_find_keyword("up_key"),				settings_element_type.input, "key_up",					 global.key_up,0],
	[scr_find_keyword("down_key"),				settings_element_type.input, "key_down",			   global.key_down,0],
	[scr_find_keyword("left_key"),				settings_element_type.input, "key_left",		   	   global.key_left,0],
	[scr_find_keyword("right_key"),				settings_element_type.input, "key_right",			  global.key_right,0],
	[scr_find_keyword("drop_item_key"),			settings_element_type.input, "drop_item_key",	  global.drop_item_key,0],
	[scr_find_keyword("pickup_key"),			settings_element_type.input, "pickup_key",			 global.pickup_key,0],
	[scr_find_keyword("attack_key"),			settings_element_type.input, "attack_key",			 global.attack_key,0],
	[scr_find_keyword("interact_key"),			settings_element_type.input, "interact_key",	   global.interact_key,0],
	[scr_find_keyword("combination_key"),		settings_element_type.input, "combination_key", global.combination_key,0],
)

inputting=false
toinput=0
applyword=scr_find_keyword("apply_settings")
declineword=scr_find_keyword("decline_settings")
//set_to_defaultword=scr_find_keyword("set_to_default")
