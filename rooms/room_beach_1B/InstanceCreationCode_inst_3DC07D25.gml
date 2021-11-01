if story_tag_exist("ewgen_saved_from_slimes"){
	if !story_tag_exist("help_ewgen_with_water"){
		sprite_index = spr_ewgen_downed
	}
	exit
}
path_start(path_ewgen_run,1,path_action_continue,false)
event_register(id,EVENT_ENEMY_KILLED,ewgen_if_no_more_slimes,[obj_enemy_slime])
