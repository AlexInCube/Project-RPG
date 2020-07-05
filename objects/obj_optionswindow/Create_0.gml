event_inherited();
window_name=scr_find_keyword("settings")
window_width=450
window_height=300

drawelementstart = 0

ds_options = scr_create_menu_page(
	[scr_find_keyword("audio_settings"),		menu_element_type.title],
	[scr_find_keyword("master_volume"),			menu_element_type.slider, scr_change_volume,global.mastervolume,5],
	[scr_find_keyword("music_volume"),			menu_element_type.slider, scr_change_volume,global.musicvolume,5],
	[scr_find_keyword("sound_volume"),			menu_element_type.slider, scr_change_volume,global.soundvolume,5],
	[scr_find_keyword("graphics_settings"),		menu_element_type.title],
	[scr_find_keyword("resolution"),			menu_element_type.shift, scr_change_resolution,0,["1280x720","1536x874","1920x1080"]],
	[scr_find_keyword("fullscreen_mode"),		menu_element_type.toggle, scr_change_window_mode,global.fullscreen],
	[scr_find_keyword("interface_settings"),	menu_element_type.title],
	[scr_find_keyword("gui_size"),				menu_element_type.shift, scr_change_gui_size,global.guisize,[scr_find_keyword("gui_small"),scr_find_keyword("gui_standard"),scr_find_keyword("gui_large")]],
	[scr_find_keyword("language"),				menu_element_type.shift, scr_change_language,0,["russian","english"]],
	[scr_find_keyword("show_damage"),			menu_element_type.toggle, scr_change_show_damage,global.showdamage],
	[scr_find_keyword("controls_settings"),		menu_element_type.title],
	["up",								menu_element_type.input, "key_up",					 global.key_up],
	["down",							menu_element_type.input, "key_down",			   global.key_down],
	["left",							menu_element_type.input, "key_left",		   	   global.key_left],
	["right",							menu_element_type.input, "key_right",			  global.key_right],
	["drop_item_key",					menu_element_type.input, "drop_item_key",	  global.drop_item_key],
	["attack_key",						menu_element_type.input, "attack_key",			 global.attack_key],
	["interact_key",					menu_element_type.input, "interact_key",	   global.interact_key],
	["pickup_key",						menu_element_type.input, "pickup_key",			 global.pickup_key],
	["combination_key",					menu_element_type.input, "combination_key", global.combination_key],
)