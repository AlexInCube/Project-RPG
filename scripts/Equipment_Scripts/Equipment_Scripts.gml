function recalculate_stats(inventory) {
	var ds_width = ds_grid_width(inventory)
	for(var i=0;i<ds_width;i++){
		var _item_struct = return_struct_from_item_index_by_item_inv(inventory,i)
		if _item_struct != undefined{
			for(var s=0;s<array_length(_item_struct.stats);s++){
				var stat_struct = variable_struct_get(obj_player_stats.player_stats,_item_struct.stats[@ s][@ 0])
				stat_struct.addModifier([_item_struct.stats[@ s][@ 1],_item_struct.stats[@ s][@ 2]])
			}
		}
	}
	weapon_equip()
}


/// @description Create weapon object from item in hand
/// @function weapon_equip();
function weapon_equip() {
	instance_destroy(obj_weapon_controller)
	var _item_struct = return_struct_from_item_index_by_item_inv(global.equipment,4)
	if !instance_exists(obj_weapon_controller) and global.equipment[# 4, 0] != NO_ITEM and _item_struct[$ "item_type"] == ITEM_TYPE_WEAPON{
		var inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_weapon_controller)
		with(inst){
			weapon_create_script = _item_struct[$ "weapon_create_script"]
			script_execute_ext(weapon_create_script,[global.equipment,4])
		}
	}
}
