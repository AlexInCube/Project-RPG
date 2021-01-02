function setup_default_settings() {
global.settings = {
	audio : {
		mastervolume: 0.5,
		musicvolume: 0.5,
		soundvolume: 0.5
	},
	video : {
		fullscreen : false,
		width : display_get_width(),
		height : display_get_height(),
		v_sync : false,
		game_speed: 60	
	},
	interface : {
		guisize: 1,
		language: 0,//0 - Russian, 1 - English
		showdamage:	true
	},
	game : {
	},
	controls : {
		key_up : ord("W"),		
		key_left :	ord("A"),
		key_right :	ord("D"),
		key_down :	ord("S"),

		inventory_hotkey1 :	ord("1"),
		inventory_hotkey2 :	ord("2"),
		inventory_hotkey3 :	ord("3"),
		inventory_hotkey4 :	ord("4"),
		inventory_hotkey5 :	ord("5"),
		inventory_hotkey6 :	ord("6"),
		inventory_hotkey7 :	ord("7"),
		inventory_hotkey8 :	ord("8"),
		inventory_hotkey9 :	ord("9"),
		inventory_hotkey10 : ord("0"),

		pickup_key : vk_space,
		interact_key :	ord("E"),
		attack_key : ord("V"),
		equipment_key :	ord("U"),
		inventory_key :	ord("I"),
		questlist_key :	ord("O"),
		drop_item_key :	ord("Q"),
		combination_key : vk_control,
		pause_key :	vk_escape,
		reloading_key :	ord("R"),

		developer_key :	vk_f5
		},
	}
show_debug_message("Fullscreen: "+string(global.settings.video.fullscreen)+" Width: "+string(global.settings.video.width)+" Height: "+string(global.settings.video.height))
}

function apply_settings() {
	with(obj_optionswindow){
		options_execute_scripts()
		save_settings()
		instance_destroy()
	}
}
	
function settodefault() {
	with(obj_optionswindow){
		setup_default_settings()//Setup default struct

		options_execute_scripts()
	
		open_settings()//Destroy settings window
		open_settings()//Open Settings Window
	}
}

function options_execute_scripts(){
	with obj_optionswindow
	{//Apply all settings
		var ds_grid = ds_options
		var ds_height = ds_grid_height(ds_grid)
		for(var i=0;i<ds_height-1;i++)
		{
			switch(ds_grid[# 1,i])//Get element type
			{
				//ds_grid[# 2,i] is script, ds_grid[# 3,i] value in options.
				case settings_element_type.toggle:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
				break;
				case settings_element_type.shift:
					script_execute_ext(ds_grid[# 2,i],[ds_grid[# 3,i],ds_grid[# 4,i]])
				break;
				case settings_element_type.slider:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
				break;
			}
		}
	}
}

function declinesettings() {
	with(obj_optionswindow){
		instance_destroy()
	}
}

function save_settings(){
	var _struct = json_stringify(global.settings)
	save_string_in_json(_struct,"game_settings.json")
}

function load_settings(){
	// Load JSON
	var _json_settings = load_string_from_json("game_settings.json");//Get string which contain in file
	if !is_undefined(_json_settings){
		var temp_struct = json_parse(_json_settings)//Convert settings string into struct
		var sections_names_array = variable_struct_get_names(temp_struct)//Get sections names
		with(global.settings)
		{
			//Loop through sections, video, audio and etc.
			for(var i=0;i<array_length(sections_names_array);i++)
			{
				var section_struct = temp_struct[$ sections_names_array[i]]
				if !is_struct(section_struct){continue}
				var options_array = variable_struct_get_names(section_struct)
				//Loop through all options in section
				for(var j=0;j<array_length(options_array);j++)
				{
					//Setup section -> option
					//If variable exists in global.settings, setup him.
					variable_struct_set(global.settings[$ sections_names_array[i]],options_array[j],section_struct[$ options_array[j]])
				}
			}
		}
	}
}

///@description Need for draw slider
function calculate_bars_modifier(old_value, old_min, old_max, new_min, new_max) {
	var old_range	= (old_max - old_min);
	var new_range	= (new_max - new_min);
	var new_value	= (((old_value - old_min) * new_range) / old_range) + new_min;

	return new_value;
}

