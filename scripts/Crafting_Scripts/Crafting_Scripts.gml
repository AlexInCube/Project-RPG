#macro CRAFTING_GROUP_ALL "craft_group_all_recipes"
#macro CRAFTING_GROUP_CONSUMABLES "craft_group_consumable_recipes"
#macro CRAFTING_GROUP_OTHER "craft_group_other_recipes"
#macro CRAFTING_STATION_PLAYER "station_player"

function register_craft_recipes(){
	global.craft_index = {
		craft_recipes : ds_map_create(),
		recipes_groups : ds_map_create()
	}
	craft_add_group(CRAFTING_GROUP_ALL,spr_craft_group_all_items)
	craft_add_group(CRAFTING_GROUP_CONSUMABLES,spr_craft_group_consumables)
	craft_add_group(CRAFTING_GROUP_OTHER,spr_craft_group_materials)

	
	craft_add("small_health_potion",CRAFTING_GROUP_CONSUMABLES,[["green_leaf",1],["empty_small_bottle",1]],[CRAFTING_STATION_PLAYER],["small_health_potion",1])
	craft_add("small_mana_potion",CRAFTING_GROUP_CONSUMABLES,[["blue_leaf",1],["empty_small_bottle",1]],[CRAFTING_STATION_PLAYER],["small_mana_potion",1])
	craft_add("iron_ingot",CRAFTING_GROUP_OTHER,[["iron_ore",1]],[CRAFTING_STATION_PLAYER],["iron_ingot",1])
}

//
function craft_add(craft_id,group_name,req_items,_stations,item_craft){
	global.craft_index.craft_recipes[? craft_id] = {
		required_items : req_items,
		stations : _stations,
		item_crafted : item_craft
	}
	array_push(global.craft_index.recipes_groups[? group_name][$ "recipes_list"],craft_id)
	array_push(global.craft_index.recipes_groups[? CRAFTING_GROUP_ALL][$ "recipes_list"],craft_id)
}

function craft_add_group(group_name,group_spr){
	global.craft_index.recipes_groups[? group_name] = {
		locale_group_name : find_keyword(group_name),
		group_sprite : group_spr,
		recipes_list : []
	}
}