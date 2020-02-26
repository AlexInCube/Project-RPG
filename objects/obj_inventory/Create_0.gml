/// @description Insert description here
// You can write your code in this editor
global.inventory = ds_grid_create(30, 2); //Width - slot amount, height - unique parameters for itemstack (0 - item contained, 1 - itemstack amount)
ds_grid_clear(global.inventory, 0);
global.armor_equipped = ds_grid_create(7, 2); 
ds_grid_clear(global.armor_equipped, 0);
global.mouse_slot = ds_grid_create(1, 2);
ds_grid_clear(global.mouse_slot, 0);
global.chestinventory = ds_grid_create(30, 2); 
ds_grid_clear(global.chestinventory,0)
global.crafting_inventory = ds_grid_create(4, 2);
ds_grid_clear(global.crafting_inventory,0)

guistate="isClosed"
inventorylock=false



scr_gain_item(item.small_health_potion, 10)
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
scr_gain_item(item.iron_ingot,32)
scr_gain_item(item.iron_ore,10)