function add_armor(name, sprite_index, phys_armor, magic_armor, armor_type, item_struct) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = 1
		self.phys_armor = phys_armor
		self.magic_armor = magic_armor
		item_type = armor_type
	}
}

function add_weapon(name, sprite_index, phys_damage, magic_damage, weapon_create_script,item_struct) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = 1
		self.phys_damage = phys_damage
		self.magic_damage = magic_damage
		item_type = ITEM_TYPE_WEAPON
		self.weapon_create_script = weapon_create_script
	}
}

function add_potion(name, sprite_index, stackable, item_struct, arg_array) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = stackable
		if !is_undefined(arg_array){
		self.arg_array = arg_array
		}else{
		self.arg_array = []
		}
		item_type = ITEM_TYPE_POTION
	}
}

function add_components(name, sprite_index, stackable) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new default_item()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = stackable
		item_type = ITEM_TYPE_COMPONENTS
	}
}

function add_spell(name, sprite_index, item_struct, arg_array) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = 1
		self.arg_array = arg_array
		item_type = ITEM_TYPE_SPELL
	}
}

function add_other_quick_usable(name, sprite_index, stackable, item_struct, arg_array) {
	var ds_size = ds_list_size(global.item_index)
	global.item_index[| ds_size] = new item_struct()
	with(global.item_index[| ds_size]){
		item_unlocale_name = name
		item_locale_name = find_keyword(item_unlocale_name)
		item_sprite = sprite_index
		item_description = find_keyword(item_unlocale_name+"_description")
		item_stacking = stackable
		if !is_undefined(arg_array){
		self.arg_array = arg_array
		}else{
		self.arg_array = []
		}
		item_type = ITEM_TYPE_UNDEFINED
	}
}