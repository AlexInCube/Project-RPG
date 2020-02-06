/// @param key

// return the locale string for a given key

var key = argument0;

if !is_string(key){string(key)}
if ( ds_map_exists( global.localization_map, key ) )
{
	return ds_map_find_value( global.localization_map, key );
} else {
	return key;
}
