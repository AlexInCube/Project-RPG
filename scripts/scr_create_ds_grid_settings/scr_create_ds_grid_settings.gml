/*
Title - Settings Category
Slider - It was earlier a slider,
but now the slide has been replaced by arrows and the last digit of the array determines the gradation as far as the value should be shifted by the arrow.
Shift - Same as the slider, but with a gradation of 1.
Toggle - Change value to TRUE or FALSE
Input - Change the assigned key
*/
ds_options = scr_create_menu_page(
	//0                                         //1                           //2               //3				   //4 //5 //6
	[scr_find_keyword("audio_settings"),		settings_element_type.title],
	[scr_find_keyword("master_volume"),			settings_element_type.slider, scr_change_volume,global.mastervolume,0.05,0,1],
	[scr_find_keyword("music_volume"),			settings_element_type.slider, scr_change_volume,global.musicvolume,0.05,0,1],
	[scr_find_keyword("sound_volume"),			settings_element_type.slider, scr_change_volume,global.soundvolume,0.05,0,1],
	[scr_find_keyword("graphics_settings"),		settings_element_type.title],
	[scr_find_keyword("resolution"),			settings_element_type.shift, scr_change_resolution,0,["1280x720","1536x874","1920x1080"]],
	[scr_find_keyword("fullscreen_mode"),		settings_element_type.toggle, scr_change_window_mode,global.fullscreen],
	[scr_find_keyword("interface_settings"),	settings_element_type.title],
	[scr_find_keyword("gui_size"),				settings_element_type.slider, scr_change_gui_size,global.guisize,0.05,0.5,1.3],
	[scr_find_keyword("language"),				settings_element_type.shift, scr_change_language,0,[scr_find_keyword("russian_language"),scr_find_keyword("english_language")]],
	[scr_find_keyword("show_damage"),			settings_element_type.toggle, scr_change_show_damage,global.showdamage],
	[scr_find_keyword("controls_settings"),		settings_element_type.title],
	[scr_find_keyword("up_key"),				settings_element_type.input, "key_up",					 global.key_up],
	[scr_find_keyword("down_key"),				settings_element_type.input, "key_down",			   global.key_down],
	[scr_find_keyword("left_key"),				settings_element_type.input, "key_left",		   	   global.key_left],
	[scr_find_keyword("right_key"),				settings_element_type.input, "key_right",			  global.key_right],
	[scr_find_keyword("drop_item_key"),			settings_element_type.input, "drop_item_key",	  global.drop_item_key],
	[scr_find_keyword("pickup_key"),			settings_element_type.input, "pickup_key",			 global.pickup_key],
	[scr_find_keyword("attack_key"),			settings_element_type.input, "attack_key",			 global.attack_key],
	[scr_find_keyword("interact_key"),			settings_element_type.input, "interact_key",	   global.interact_key],
	[scr_find_keyword("inventory_key"),			settings_element_type.input, "inventory_key",	  global.inventory_key],
	[scr_find_keyword("combination_key"),		settings_element_type.input, "combination_key", global.combination_key],
	[scr_find_keyword("questlist_key"),			settings_element_type.input, "questlist_key",	  global.questlist_key],
	[scr_find_keyword("equipment_key"),			settings_element_type.input, "equipment_key",	  global.equipment_key],
)