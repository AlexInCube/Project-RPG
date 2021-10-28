function add_armor(item_id, sprite_index, stats, armor_type, item_struct) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = 1
		self.stats = stats
		item_type = armor_type
	}
}

function add_weapon(item_id, sprite_index, stats, weapon_create_script,item_struct) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = 1
		self.stats = stats
		item_type = ITEM_TYPE_WEAPON
		self.weapon_create_script = weapon_create_script
	}
}

function add_potion(item_id, sprite_index, stackable, item_struct, arg_array) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = stackable
		if !is_undefined(arg_array){
		self.arg_array = arg_array
		}else{
		self.arg_array = []
		}
		item_type = ITEM_TYPE_POTION
	}
}

function add_components(item_id, sprite_index, stackable) {
	global.item_index[? item_id] = new default_item()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = stackable
		item_type = ITEM_TYPE_COMPONENTS
	}
}

function add_other_item(item_id, sprite_index, stackable, item_t, item_struct) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = stackable
		item_type = item_t
	}
}

function add_spell(item_id, sprite_index, item_struct, arg_array) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = 1
		self.arg_array = arg_array
		item_type = ITEM_TYPE_SPELL
	}
}

function add_other_quick_usable(item_id, sprite_index, stackable, item_struct, arg_array) {
	global.item_index[? item_id] = new item_struct()
	with(global.item_index[? item_id]){
		item_locale_name = find_keyword(item_id)
		item_sprite = sprite_index
		item_description = find_keyword(item_id+"_description")
		item_stacking = stackable
		if !is_undefined(arg_array){
		self.arg_array = arg_array
		}else{
		self.arg_array = []
		}
		item_type = ITEM_TYPE_UNDEFINED
	}
}