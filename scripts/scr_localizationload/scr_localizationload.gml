/// @description Load locale data

global.scr_find_keyworduages		= [];
global.scr_find_keyword_idx		= 0;
global.yd_locale_map	= ds_map_create();

	// open the locale file for reading
	var locale_file	= file_text_open_read( global.language+".txt" );
	

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
	
	ds_map_copy(global.yd_locale_map,locale_map);
	/*
	var k = ds_map_find_first(global.yd_locale_map),
    maptext = ""
	while (!is_undefined(k))
	{
	maptext += k + ": " + global.yd_locale_map[? k] + "\n";
	 k = ds_map_find_next(global.yd_locale_map, k);
	 show_debug_message(maptext)
	}
	*/
	

file_text_close(locale_file)
