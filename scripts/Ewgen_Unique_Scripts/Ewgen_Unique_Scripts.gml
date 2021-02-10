function ewgen_if_no_more_slimes(){
	var _list = ds_list_create()
	var radius = 50
	var _num = collision_rectangle_list(obj_ewgennpc.x-radius,obj_ewgennpc.y-radius,obj_ewgennpc.x+radius,obj_ewgennpc.y+radius,obj_enemy_slime,false,true,_list,false)
	if _num > 0{
		if ds_list_size(_list)<=1
		{
			with(obj_ewgennpc)
			{
				choice_variable = "saved_from_slimes"
				add_story_tag("ewgen_saved_from_slimes")
				path_end()
				//event_unregister([event.enemyKilled,obj_enemy_slime],id)
			}
		}
	}
	ds_list_destroy(_list)
}