function create_ds_grid_settings() {
	/*
	Title - Settings Category
	Slider - It was earlier a slider,
	but now the slide has been replaced by arrows and the last digit of the array determines the gradation as far as the value should be shifted by the arrow.
	Shift - Same as the slider, but with a gradation of 1.
	Toggle - Change value to TRUE or FALSE
	Input - Change the assigned key
	*/
	var resolution_array = ["1280x720","1280x768","1280x1024","1360x768","1366x768","1440x900","1400x1050","1536x1024","1600x900","1600x1024","1600x1200","1680x1050","1920x1080","1920x1200","2048x1080","2560x1440","3840x2160"]
	
	var cr = string(global.settings.video.width)+"x"+string(global.settings.video.height)//Full string, for example "1280x720"
	var sr = 0//Position in resolution array
	for (var i=0;i<array_length(resolution_array)-1;i++){
		if resolution_array[i] == cr{
			sr = i
			break
		}else{
			array_set(resolution_array,array_length(resolution_array),string(global.settings.video.width)+"x"+string(global.settings.video.height))
			sr = array_length(resolution_array)-1
		}
	}
	ds_options = create_menu_page(
		//0  Locale word                        //1 Element Type            //2               //3				   //4 //5 //6
		[find_keyword("audio_settings"),		settings_element_type.title],
		[find_keyword("master_volume"),			settings_element_type.slider, change_volume,global.settings.audio.mastervolume,0.05,0,1],
		[find_keyword("music_volume"),			settings_element_type.slider, change_volume,global.settings.audio.musicvolume,0.05,0,1],
		[find_keyword("sound_volume"),			settings_element_type.slider, change_volume,global.settings.audio.soundvolume,0.05,0,1],
		[find_keyword("graphics_settings"),		settings_element_type.title],
		[find_keyword("resolution"),			settings_element_type.shift, change_resolution,sr,resolution_array],
		[find_keyword("fullscreen_mode"),		settings_element_type.toggle, change_window_mode,global.settings.video.fullscreen],
		[find_keyword("fps_limit"),				settings_element_type.slider,change_game_speed,global.settings.video.game_speed,10,10,300],
		[find_keyword("interface_settings"),	settings_element_type.title],
		[find_keyword("gui_size"),				settings_element_type.slider, change_gui_size,global.settings.interface.guisize,0.05,0.5,1.3],
		[find_keyword("language"),				settings_element_type.shift, change_language,global.settings.interface.language,[find_keyword("russian_language"),find_keyword("english_language")]],
		[find_keyword("show_damage"),			settings_element_type.toggle, change_show_damage,global.settings.interface.showdamage],
		//[find_keyword("game_settings"),			settings_element_type.title],
		[find_keyword("controls_settings"),		settings_element_type.title],
		[find_keyword("up_key"),				settings_element_type.input, "key_up",					 global.settings.controls.key_up],
		[find_keyword("down_key"),				settings_element_type.input, "key_down",			   global.settings.controls.key_down],
		[find_keyword("left_key"),				settings_element_type.input, "key_left",		   	   global.settings.controls.key_left],
		[find_keyword("right_key"),				settings_element_type.input, "key_right",			  global.settings.controls.key_right],
		[find_keyword("drop_item_key"),			settings_element_type.input, "drop_item_key",	  global.settings.controls.drop_item_key],
		[find_keyword("pickup_key"),			settings_element_type.input, "pickup_key",			 global.settings.controls.pickup_key],
		[find_keyword("attack_key"),			settings_element_type.input, "attack_key",			 global.settings.controls.attack_key],
		[find_keyword("interact_key"),			settings_element_type.input, "interact_key",	   global.settings.controls.interact_key],
		[find_keyword("inventory_key"),			settings_element_type.input, "inventory_key",	  global.settings.controls.inventory_key],
		[find_keyword("combination_key"),		settings_element_type.input, "combination_key", global.settings.controls.combination_key],
		[find_keyword("questlist_key"),			settings_element_type.input, "questlist_key",	  global.settings.controls.questlist_key],
		[find_keyword("equipment_key"),			settings_element_type.input, "equipment_key",	  global.settings.controls.equipment_key],
	)
}
