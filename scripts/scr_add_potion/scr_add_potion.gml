/// @description scr_add_potion(item_ID, name, sprite_index,stackable, action);
/// @function scr_add_potion
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param stackable
/// @param action
var iid = argument0;
global.item_index[# iid, item_stat.name] = scr_load_string_json(argument1);
global.item_index[# iid, item_stat.sprite_index] = argument2;
global.item_index[# iid, item_stat.description] = scr_load_string_json(string(argument1)+"_description")
global.item_index[# iid, item_stat.stackable] = argument3;
global.item_index[# iid, item_stat.action_script] = argument4;

global.item_index[# iid, item_stat.type] = item_type.potion;