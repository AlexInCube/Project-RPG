function setup_default_settings() {
global.settings = {
	lastsave : "rpgsave",
	audio : {
		mastervolume: 0.5,
		musicvolume: 0.5,
		soundvolume: 0.5
	},
	video : {
		fullscreen : false,
		width : display_get_width(),
		height : display_get_height()
	},
	interface : {
		guisize: 1,
		language: 0,//0 - Russian, 1 - English
		showdamage:	true
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


function savesettings() {
	var ds_grid = obj_optionswindow.ds_options
	var ds_height = ds_grid_height(ds_grid)
	for(i=0;i<ds_height-1;i++){
		switch(ds_grid[# 1,i]){
			case settings_element_type.toggle:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			break;
			case settings_element_type.shift:
					script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
			break;
			case settings_element_type.slider:
					script_execute(ds_grid[# 2,i],i,ds_grid[# 3,i])
			break;
			case settings_element_type.input:
					variable_global_set(ds_grid[# 2,i], ds_grid[# 3, i])
			break;
		}
	}
	
		
	var _struct = json_stringify(global.settings)
	save_string_in_json(_struct,"game_settings.json")

	instance_destroy()
}

function load_settings(){
	// Load JSON
	var _json = load_string_from_json("game_settings.json");
	global.settings = json_parse(_json);
}
/// Saving a string as a buffer
function save_string_in_json (_string, _filename) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

/// Loading a string from a buffer
function load_string_from_json (_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);
	return _string;
}
