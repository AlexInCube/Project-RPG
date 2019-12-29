/// @description Insert description here
// You can write your code in this editor
global.inventory = ds_grid_create(30, 2); 
ds_grid_clear(global.inventory, 0);
global.armor_equipped = ds_grid_create(7, 2); 
ds_grid_clear(global.armor_equipped, 0);
//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0
global.mouse_slot = ds_grid_create(1, 2);



guistate="isClosed"

scr_registeritems()

global.crafting_inventory = ds_grid_create(4, 2);
scr_initrecipes()



scr_gain_item(item.small_health_potion, 7)
scr_gain_item(item.small_mana_potion, 8)
scr_gain_item(item.iron_helmet, 1)
scr_gain_item(item.iron_chestplate, 1)
scr_gain_item(item.iron_leggings, 1)
scr_gain_item(item.iron_boots, 1)
scr_gain_item(item.iron_sword, 1)
scr_gain_item(item.lightningstaff, 1)
scr_gain_item(item.greenleaf, 10)
scr_gain_item(item.blueleaf, 10)
scr_gain_item(item.small_empty_bottle,10)
scr_gain_item(item.scroll_dash,1)
scr_gain_item(item.scroll_fireball,1)
scr_gain_item(item.leather,32)