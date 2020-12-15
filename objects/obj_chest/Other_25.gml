///@description Load Event
var _map = __eventArgs;
if ds_exists(chestinventory,ds_type_grid){
	ds_grid_destroy(chestinventory)
}
chestinventory = ds_grid_create(slots_quantity,INVENTORY_HEIGHT)
parse_inventory(chestinventory,_map[? "chestinventory"])