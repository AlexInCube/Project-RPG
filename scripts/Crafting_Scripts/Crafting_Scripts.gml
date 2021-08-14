#macro CRAFTING_GROUP_CONSUMABLES "consumable_items"
#macro CRAFTING_WORKBENCH_PLAYER "workbench_player"

function register_craft_recipes(){
	global.craft_index = {
		craft_recipes : ds_map_create(),
		recipes_groups : ds_map_create()
	}
	craft_add_group(CRAFTING_GROUP_CONSUMABLES)
	
	craft_add("small_health_potion_craft",CRAFTING_GROUP_CONSUMABLES,[["green_leaf",1],["empty_small_bottle",1]],[CRAFTING_WORKBENCH_PLAYER],["small_health_potion",1])
	craft_add("small_mana_potion_craft",CRAFTING_GROUP_CONSUMABLES,[["blue_leaf",1],["empty_small_bottle",1]],[CRAFTING_WORKBENCH_PLAYER],["small_mana_potion",1])
}

//
function craft_add(craft_id,group_name,req_items,workbench,item_craft){
	global.craft_index.craft_recipes[? craft_id] = {
		required_items : req_items,
		workbenches : workbench,
		item_crafted : item_craft
	}
	array_push(global.craft_index.recipes_groups[? group_name],craft_id)
}

function craft_add_group(group_name){
	global.craft_index.recipes_groups[? group_name] = []
}