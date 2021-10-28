function sh_give_item(args){
	if instance_exists(obj_inventory){
		item_gain(args[1],args[2])
	}
}

function meta_give_item(){
	var items_list = []
	var item_id = ds_map_find_first(global.item_index)
	for(var i = 0; i < ds_map_size(global.item_index); i++){
		array_push(items_list,item_id)
		item_id = ds_map_find_next(global.item_index,item_id)
	}
	return {
		description: "Give item for player",
		arguments: ["item_id", "quantity"],
		suggestions: [
			items_list
		],
		argumentDescriptions: [
			"Item ID",
			"Quantity",
		]
	}
}