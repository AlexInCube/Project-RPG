//Player inventory
//Width - slot amount
//Height - unique parameters for itemstack (0 - item contained, 1 - itemstack amount, 2 - nbt)
#macro INVENTORY_HEIGHT 3 //used for mark default height grid for inventories
global.inventory = ds_grid_create(15, INVENTORY_HEIGHT);
ds_grid_clear(global.inventory, NO_ITEM);
global.equipment = ds_grid_create(5, INVENTORY_HEIGHT); //Player equipment
ds_grid_clear(global.equipment, NO_ITEM);
global.mouse_slot = ds_grid_create(1, INVENTORY_HEIGHT);//Temp mouse item slot
ds_grid_clear(global.mouse_slot, NO_ITEM);


inventorylock=false
inventory_size = ds_grid_width(global.inventory)

function reset_stats(ev){
	/*
	console_log("Inv: "+string(argument1._inv))
	console_log("Slot: "+string(argument1._slot))
	console_log("Item before click: "+string(argument1.item_before_click))
	console_log("Item: "+string(return_struct_from_item_index_by_item_inv(argument1._inv,argument1._slot)))
	*/
	if ev._inv != global.equipment exit
	
	var stat_names_arr = variable_struct_get_names(obj_player_stats.stats)
	for(var i = 0;i < array_length(stat_names_arr);i++){
		if typeof(obj_player_stats.stats[$ stat_names_arr[i]]) == "struct"{
			obj_player_stats.stats[$ stat_names_arr[i]].removeModifier(argument1.item_before_click)
		}
	}
	
	recalculate_stats()
}

event_register(id,EVENT_INVENTORY_CLICKED,reset_stats)