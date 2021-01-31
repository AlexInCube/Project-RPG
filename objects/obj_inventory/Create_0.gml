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

event_register([event.inventory_clicked,global.equipment],id,recalculate_stats,global.equipment)


item_gain("wooden_stick",1)
