/// @description scr_add_spell(item_ID, name, manacost, action_script);
/// @function scr_add_spell
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param manacost
/// @param cooldown
/// @param action
var iid = argument0;
global.item_index[# iid, item_stat.name] = scr_load_string_json(argument1);
global.item_index[# iid, item_stat.sprite_index] = argument2;
global.item_index[# iid, item_stat.description] = scr_load_string_json(string(argument1)+"_description")
global.item_index[# iid, item_stat.stackable] = 1;
global.item_index[# iid, item_stat.manacost] = argument3;
global.item_index[# iid, item_stat.cooldown] = argument4;//alarm index objplayer
global.item_index[# iid, item_stat.action_script] = argument5;

global.item_index[# iid, item_stat.type] = item_type.spell;

show_debug_message(alarm_get(global.item_index[# iid, item_stat.cooldown]))