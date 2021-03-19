function ewgen_if_no_more_slimes(){
	var _list = ds_list_create()
	var radius = 50
	var _num = collision_rectangle_list(obj_ewgennpc.x-radius,obj_ewgennpc.y-radius,obj_ewgennpc.x+radius,obj_ewgennpc.y+radius,obj_enemy_slime,false,true,_list,false)
	if _num > 0{
		if ds_list_size(_list)<=1
		{
			with(obj_ewgennpc)
			{
				var _seqElm = layer_sequence_create("Instances",x,y,sq_ewgen_to_downed)
				var _seqInst = layer_sequence_get_instance(_seqElm)
				sequence_instance_override_object(_seqInst,obj_ewgennpc,id)
				choice_variable = "saved_from_slimes"
				story_tag_status("ewgen_saved_from_slimes",true)
				path_end()
				//event_unregister([event.enemyKilled,obj_enemy_slime],id)
			}
		}
	}
	ds_list_destroy(_list)
}