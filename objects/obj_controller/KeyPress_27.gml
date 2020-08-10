//Exit to main menu
if instance_exists(obj_player){
	obj_player.persistent=false
	
}
obj_player_stats.persistent=false
obj_inventory.persistent=false
ds_grid_destroy(global.inventory)
ds_grid_destroy(global.armor_equipped)
ds_grid_destroy(global.crafting_inventory)
ds_grid_destroy(global.mouse_slot)
instance_destroy()
room_goto(room_main)