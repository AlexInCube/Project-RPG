/// @function add_components
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param stack
function add_components(argument0, argument1, argument2, argument3) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = argument3;

	global.item_index[# iid, item_stat.type] = item_type.components;


}
