/// @description scr_add_potion(item_ID, name, sprite_index,stackable, action);
/// @function scr_add_potion
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param stackable
/// @param action
function scr_add_potion(argument0, argument1, argument2, argument3, argument4) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = scr_find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = scr_find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = argument3;
	global.item_index[# iid, item_stat.action_script] = argument4;

	global.item_index[# iid, item_stat.type] = item_type.potion;


}
