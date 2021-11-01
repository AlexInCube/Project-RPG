event_fire(EVENT_ENEMY_KILLED,{entity_name : object_index})
if ds_exists(buff_grid,ds_type_grid){
	ds_grid_destroy(buff_grid)
	buff_grid = -1
}
Stat_List_Delete(stats)