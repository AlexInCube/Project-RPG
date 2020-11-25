/// @description Load locale data
function localization_load() {

	global.localization_map	= ds_map_create();

		// open the locale file for reading
		var lang_name = "custom_lang"
		switch(global.settings.interface.language){
			case 0: lang_name = "russian" break
			case 1: lang_name = "english" break
		}
		var locale_file	= file_text_open_read(lang_name+".txt" );
	

		// build the JSON text
		var json_str	= "";
		var j = 0;
		while ( !file_text_eof(locale_file) )
		{
			json_str += file_text_read_string(locale_file);
			file_text_readln(locale_file);
			j++;
		}
		file_text_close(locale_file);
		show_debug_message( "Loaded locale_map from " + string(j) + " lines of text." );

		// convert the JSON to a usable ds_map
		var locale_map = json_decode(json_str);
	
		ds_map_copy(global.localization_map,locale_map);
	

	file_text_close(locale_file)
}

/// @param key
function find_keyword(argument0) {

	// return the locale string for a given key
	var key = argument0;

	if !is_string(key){string(key)}
	if ( ds_map_exists( global.localization_map, key ) )
	{
		return ds_map_find_value( global.localization_map, key );
	} else {
		return key;
	}
}