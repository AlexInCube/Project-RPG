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

event_register([event.inventory_slot_clicked,global.equipment],id,recalculate_stats,global.equipment)

item_gain("small_health_potion", 4, global.inventory)
item_gain("empty_big_bottle",2, global.inventory)
item_gain("big_health_potion",2, global.inventory,2)
item_gain("shotgun", 1, global.inventory)
item_gain("small_mana_potion", 8, global.inventory)
item_gain("light_staff",1, global.inventory)
item_gain("iron_helmet", 1, global.inventory)

item_gain("iron_leggings", 1, global.inventory)
item_gain("iron_boots", 1, global.inventory)
/*
item_gain(item.iron_sword, 1)
item_gain(item.lightningstaff, 1)
item_gain(item.greenleaf, 10)
item_gain(item.blueleaf, 10)
item_gain(item.small_empty_bottle,10)

item_gain(item.slime,40)