//Player inventory
//Width - slot amount
//Height - unique parameters for itemstack (0 - item contained, 1 - itemstack amount, 2 - nbt)
global.inventory = ds_grid_create(15, 2);
ds_grid_clear(global.inventory, NO_ITEM);
global.equipment = ds_grid_create(5, 2); //Player equipment
ds_grid_clear(global.equipment, NO_ITEM);
global.mouse_slot = ds_grid_create(1, 2);//Temp mouse item slot
ds_grid_clear(global.mouse_slot, NO_ITEM);


inventorylock=false
inventory_size = ds_grid_width(global.inventory)

event_register([event.inventory_slot_clicked,global.equipment],id,recalculate_stats,global.equipment)

gain_item("small_health_potion", 4, global.inventory)
gain_item("spell_dash",2, global.inventory)
gain_item("spell_fireball",1, global.inventory)
gain_item("shotgun", 1, global.inventory)
gain_item("small_mana_potion", 8, global.inventory)
gain_item("coin",1, global.inventory)
gain_item("iron_helmet", 1, global.inventory)

gain_item("iron_leggings", 1, global.inventory)
gain_item("iron_boots", 1, global.inventory)
/*
gain_item(item.iron_sword, 1)
gain_item(item.lightningstaff, 1)
gain_item(item.greenleaf, 10)
gain_item(item.blueleaf, 10)
gain_item(item.small_empty_bottle,10)

gain_item(item.slime,40)