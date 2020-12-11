/// @description add_potion(item_ID, name, sprite_index,stackable, action);
/// @function add_potion
function add_potion(item_ID, name, sprite_index, stackable, action, arg_array) {
	var iid = item_ID;
	//ds_list_find_index()
	
	global.item_index[# iid, item_stat.name] = find_keyword(name);
	global.item_index[# iid, item_stat.sprite_index] = sprite_index;
	global.item_index[# iid, item_stat.description] = find_keyword(string(name)+"_description")
	global.item_index[# iid, item_stat.stackable] = stackable;
	global.item_index[# iid, item_stat.action_script] = new action()
	global.item_index[# iid, item_stat.action_script][$ "item_locale_name"] = find_keyword(name)
	global.item_index[# iid, item_stat.arg_array] = arg_array;
	global.item_index[# iid, item_stat.type] = item_type.potion;
	
}
