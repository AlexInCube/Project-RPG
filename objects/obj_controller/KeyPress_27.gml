//Exit to main menu
with(inventorywindow)instance_destroy()
with(equipmentwindow)instance_destroy()
with(questlistwindow)instance_destroy()
if instance_exists(obj_player){
	obj_player.persistent=false
}
if instance_exists(obj_weapon_controller){
	obj_weapon_controller.persistent=false
}
obj_player_stats.persistent=false
obj_inventory.persistent=false
obj_questmanager.persistent=false
ds_grid_destroy(obj_questmanager.ds_quests)
ds_grid_destroy(global.inventory)
ds_grid_destroy(global.armor_equipped)
ds_grid_destroy(global.crafting_inventory)
ds_grid_destroy(global.mouse_slot)
instance_destroy()
room_goto(room_main)