/// @description add_weapon(item_ID, name, physarmor, magicarmor, armortype);
/// @function add_armor
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param physarmor
/// @param magicarmor
/// @param armortype
function add_armor(argument0, argument1, argument2, argument3, argument4, argument5) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = 1;
	global.item_index[# iid, item_stat.physarmor] = argument3;
	global.item_index[# iid, item_stat.magicarmor] = argument4;

	global.item_index[# iid, item_stat.type] = argument5


}
