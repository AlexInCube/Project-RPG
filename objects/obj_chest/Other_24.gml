///@description Save Event
var _map = __eventArgs;
ds_map_add(_map,"obj", object_get_name(object_index));
ds_map_add(_map,"chestinventory",ds_grid_write(chestinventory));