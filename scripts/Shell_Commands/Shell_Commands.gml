function sh_give_item(args){
	if instance_exists(obj_inventory){
		if array_length(args) > 1 and args[2]!=""{
			item_gain(args[1],real(args[2]))
			return "";
		}
		item_gain(args[1],1)
		return ""
	}
	return "Inventory doesn`t exists!"
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
		arguments: ["item_id", "<quantity>"],
		suggestions: [
			items_list
		],
		argumentDescriptions: [
			"Item ID",
			"Optional, default is 1",
		]
	}
}

function sh_refresh_all(){
	if instance_exists(obj_player){
		obj_player_stats.stats.hp = obj_player_stats.stats.max_hp.getValue()
		obj_player_stats.stats.mana = obj_player_stats.stats.max_mana.getValue()
		return ""
	}
	return "Player doesn`t exists!"
}

function meta_refresh_all(){
	return {
		description: "Replenish health and mana for player",
	}
}

function sh_room_change(args){
	var rm_ind = asset_get_index(args[1])
	
	if rm_ind > -1{
		if rm_ind == room_init{
			return "Go to room_init is not allowed!"
		}else{
			room_goto(rm_ind)
			return ""
		}
	}else{
		return "Room is not exists"
	}
	

}

function meta_room_change(){
	var room_names = []
	for(var i = room_first; i != -1; i = room_next(i)){
		array_push(room_names,room_get_name(i))
	}
	return {
		description: "Go to specified room. Not recommend use it, because this function not envoke inventory initialization and other.",
		arguments: ["room_name"],
		suggestions: [
			room_names
		],
		argumentDescriptions: [
			"Room name, not room index.",
		]
	}
}