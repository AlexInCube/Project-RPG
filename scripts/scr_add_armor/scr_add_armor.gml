/// @description scr_add_weapon(item_ID, name, physarmor, magicarmor, armortype);
/// @function scr_add_armor
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param physarmor
/// @param magicarmor
/// @param armortype
var iid = argument0;
global.item_index[# iid, item_stat.name] = scr_load_string_json(argument1);
global.item_index[# iid, item_stat.sprite_index] = argument2;
global.item_index[# iid, item_stat.description] = scr_load_string_json(string(argument1)+"_description")
global.item_index[# iid, item_stat.stackable] = 1;
global.item_index[# iid, item_stat.physarmor] = argument3;
global.item_index[# iid, item_stat.magicarmor] = argument4;

global.item_index[# iid, item_stat.type] = argument5