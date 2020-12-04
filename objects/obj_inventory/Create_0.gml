global.inventory = ds_grid_create(15, 2); //Player inventory//Width - slot amount, height - unique parameters for itemstack (0 - item contained, 1 - itemstack amount)
ds_grid_clear(global.inventory, 0);
global.equipment = ds_grid_create(5, 2); //Player equipment
ds_grid_clear(global.equipment, 0);
global.mouse_slot = ds_grid_create(1, 2);//Temp mouse item slot
ds_grid_clear(global.mouse_slot, 0);


inventorylock=false
inventory_size = ds_grid_width(global.inventory)

event_register([event.inventory_slot_clicked,global.equipment],id,recalculate_stats,global.equipment)

gain_item(item.small_mana_potion, 4, global.inventory)
gain_item(item.scroll_dash,1, global.inventory)
gain_item(item.scroll_fireball,1, global.inventory)
//gain_item(item.shotgun, 1)
/*

gain_item(item.small_mana_potion, 8)
gain_item(item.iron_helmet, 1)

gain_item(item.iron_leggings, 1)
gain_item(item.iron_boots, 1)
gain_item(item.iron_sword, 1)
gain_item(item.lightningstaff, 1)
gain_item(item.greenleaf, 10)
gain_item(item.blueleaf, 10)
gain_item(item.small_empty_bottle,10)

gain_item(item.slime,40)