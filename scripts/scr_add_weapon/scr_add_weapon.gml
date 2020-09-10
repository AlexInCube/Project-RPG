/// @description add_weapon(item_ID, name, description, action);
/// @function add_weapon
/// @param item_ID
/// @param name
/// @param sprite_index
/// @param physdamage
/// @param magicdamage
/// @param weapon_tick_script
/// @param weapon_draw_script
/// @param weapon_create_script
/// @param weapon_alarm_script
function add_weapon(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	var iid = argument0;
	global.item_index[# iid, item_stat.name] = find_keyword(argument1);
	global.item_index[# iid, item_stat.sprite_index] = argument2;
	global.item_index[# iid, item_stat.description] = find_keyword(string(argument1)+"_description")
	global.item_index[# iid, item_stat.stackable] = 1;
	global.item_index[# iid, item_stat.physdamage] = argument3;
	global.item_index[# iid, item_stat.magicdamage] = argument4;
	global.item_index[# iid, item_stat.weapon_tick] = argument5;
	global.item_index[# iid, item_stat.weapon_draw] = argument6;
	global.item_index[# iid, item_stat.weapon_create] = argument7;
	global.item_index[# iid, item_stat.weapon_alarm] = argument8;

	global.item_index[# iid, item_stat.type] = item_type.weapon


}
