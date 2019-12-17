/// @function scr_add_components
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param stack
var iid = argument0;
global.item_index[# iid, item_stat.name] = scr_load_string_json(argument1);
global.item_index[# iid, item_stat.sprite_index] = argument2;
global.item_index[# iid, item_stat.description] = scr_load_string_json(string(argument1)+"_description")
global.item_index[# iid, item_stat.stackable] = argument3;

global.item_index[# iid, item_stat.type] = item_type.components;