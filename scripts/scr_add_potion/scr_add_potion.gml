function add_potion(name, sprite_index, stackable, item_struct, arg_array) {
	//ds_list_find_index()
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = stackable
		self.arg_array = arg_array
		item_type = ITEM_TYPE_POTION
	}
}
