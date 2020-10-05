/// @description add_spell(item_ID, name, manacost, action_script);
/// @function add_spell
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param manacost
/// @param action
function add_spell(argument0, argument1, argument2, argument3, argument4) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = 1;
	global.item_index[# iid, item_stat.manacost] = argument3;
	global.item_index[# iid, item_stat.action_script] = argument4;

	global.item_index[# iid, item_stat.type] = item_type.spell;




}
