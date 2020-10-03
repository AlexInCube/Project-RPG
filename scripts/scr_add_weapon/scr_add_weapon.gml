/// @description add_weapon(item_ID, name, sprite, phys_dmg, magic_dmg, weapon_create_script);
/// @function add_weapon
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param physdamage
/// @param magicdamage
/// @param weapon_create_script

function add_weapon(argument0, argument1, argument2, argument3, argument4, argument5) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = 1;
	global.item_index[# iid, item_stat.physdamage] = argument3;
	global.item_index[# iid, item_stat.magicdamage] = argument4;
	global.item_index[# iid, item_stat.weapon_create] = argument5;

	global.item_index[# iid, item_stat.type] = item_type.weapon


}
